#!/bin/bash

IFS=$'\n'
Lines=$(cat _includes/matrix_base.md)
Check=1

rm _includes/matrix_prod.md
echo "[" > servers.json

for Line in $Lines
do
    Line=$(echo "$Line" | sed -Ee "s/\\\\\[(\\^[0-9]+)\\\\\]/\[\1\]/g" -Ee "s/\\\\\`/\`/g")
    if [[ "$Line" =~ \[([0-9a-z-]+\.[0-9a-z]+)\] ]]; then
        raw="${BASH_REMATCH[1]}"
        base=$(curl -Ls -m 10 "https://$raw/.well-known/matrix/server" -A "https://joinmatrix.org/servers" | jq '."m.server"' | sed s/\"//g)
        if [[ -z "$base" ]] || [[ "$base" == "null" ]]; then
            DNS=$(dig "_matrix._tcp.$raw" SRV +short | sed -E 's/([0-9]+ ){2}//g')
            SRV_PORT=$(echo "$DNS" | grep -oE "^[0-9]+")
            SRV_DOMAIN=$(echo "$DNS" | grep -oE "([a-z0-9]+\.)+$" | sed 's/\.$//')
            if [[ -n "$SRV_DOMAIN" ]]; then
                PUBLIC="$SRV_DOMAIN"
                body=$(curl -Ls -m 10 "https://$SRV_DOMAIN/_matrix/federation/v1/version" -A "https://joinmatrix.org/servers")
                test=$(echo $body | jq .server)
                reg=$(curl -Ls -m 10 -X POST -H "accept: application/json" -H "Content-Type: application/json" "https://$SRV_DOMAIN/_matrix/client/r0/register" -A "https://joinmatrix.org/servers" -d '{}')
                if [[ -z "$test" ]] && [[ -n "$SRV_PORT" ]]; then
                    body=$(curl -Ls -m 10 "https://$SRV_DOMAIN:$SRV_PORT/_matrix/federation/v1/version" -A "https://joinmatrix.org/servers")
                fi
            else
                PUBLIC="$raw"
                body=$(curl -Ls -m 10 "https://$raw/_matrix/federation/v1/version" -A "https://joinmatrix.org/servers")
                reg=$(curl -Ls -m 10 -X POST -H "accept: application/json" -H "Content-Type: application/json" "https://$raw/_matrix/client/r0/register" -A "https://joinmatrix.org/servers" -d '{}')
                test=$(echo $body | jq .server)
                if [[ -z "$test" ]]; then
                    body=$(curl -Ls -m 10 "https://$raw:8448/_matrix/federation/v1/version" -A "https://joinmatrix.org/servers")
                fi
            fi
        else
            PUBLIC="$raw"
            body=$(curl -Ls -m 10 "https://$base/_matrix/federation/v1/version" -A "https://joinmatrix.org/servers")
            client=$(curl -Ls -m 10 "https://$raw/.well-known/matrix/client" -A "https://joinmatrix.org/servers" | jq '."m.homeserver"."base_url"' | sed s/\"//g | sed "s/\/$//g")
            reg=$(curl -Ls -m 10 -X POST -H "accept: application/json" -H "Content-Type: application/json" "$client/_matrix/client/r0/register" -A "https://joinmatrix.org/servers" -d '{}')
        fi
        name=$(echo $body | jq .server.name | sed s/\"//g)
        version=$(echo $body | jq .server.version | sed s/\"//g)
        closed=$(echo $reg | jq .errcode)
        if [[ $Line =~ \[(SSO|Form)\] ]] || [[ $Check -eq 0 ]]; then
            closed="null"
        fi
        if [[ "$closed" != "\"M_FORBIDDEN\"" ]]; then
            if [[ -n "$name" ]] && [[ -n "$version" ]]; then
                echo "    {" >> servers.json
                echo "        \"name\": \"$raw\"," >> servers.json
                echo "        \"domain\": \"$PUBLIC\"," >> servers.json
                while IFS="|" read -r c0 c1 c2 c3 c4 c5 c6 c7
                do
                    if [[ "$c1" =~ \[[0-9a-z-]+\.[0-9a-z]+\]\((.*)\) ]]; then
                        echo "        \"info\": \"${BASH_REMATCH[1]}\"," >> servers.json
                    fi
                    echo "        \"jurisdiction\": \"$(echo $c2 | sed -e 's/^\ //g' -e 's/\ *$//g')\"," >> servers.json
                    if [[ "$c3" =~ \[[a-zA-Z]+\]\((.*)\) ]]; then
                        echo "        \"tos\": \"${BASH_REMATCH[1]}\"," >> servers.json
                    else
                        echo "        \"tos\": null," >> servers.json
                    fi
                    if [[ "$c4" =~ \[[a-zA-Z]+\]\((.*)\) ]]; then
                        echo "        \"privacy\": \"${BASH_REMATCH[1]}\"," >> servers.json
                    else
                        echo "        \"privacy\": null," >> servers.json
                    fi
                    if [[ $Check -ne 0 ]]; then
                        echo "        \"open\": true," >> servers.json
                        # remove starts here
                        echo "        \"remarks\": \"$(echo $c6 | sed -E -e 's/^\ //g' -e 's/\ *$//g' -e 's/\[\^[0-9]+\]//g')\"," >> servers.json
                        if [[ "$c7" =~ \[(.*)\]\((.*)\) ]]; then
                            echo "        \"reg_method\": \"${BASH_REMATCH[1]}\"," >> servers.json
                            echo "        \"reg_link\": \"${BASH_REMATCH[2]}\"," >> servers.json
                        else
                            echo "        \"reg_method\": null," >> servers.json
                            echo "        \"reg_link\": null," >> servers.json
                        fi
                        # remove ends here
                    else
                        echo "        \"open\": false," >> servers.json
                        # fi here
                        echo "        \"remarks\": \"$(echo $c5 | sed -E -e 's/^\ //g' -e 's/\ *$//g' -e 's/\[\^[0-9]+\]//g')\"," >> servers.json
                        if [[ "$c6" =~ \[(.*)\]\((.*)\) ]]; then
                            echo "        \"reg_method\": \"${BASH_REMATCH[1]}\"," >> servers.json
                            echo "        \"reg_link\": \"${BASH_REMATCH[2]}\"," >> servers.json
                        else
                            echo "        \"reg_method\": null," >> servers.json
                            echo "        \"reg_link\": null," >> servers.json
                        fi
                    fi # remove
                done < <(echo "$Line")
                echo "        \"software\": \"$name\"," >> servers.json
                echo "        \"version\": \"$version\"" >> servers.json
                echo "    }," >> servers.json
                if [[ "$name" == "Synapse" ]]; then
                    echo "$Line $version |" >> _includes/matrix_prod.md
                else
                    echo "$Line $name $version |" >> _includes/matrix_prod.md
                fi
            else
                echo "$Line Error!! |" >> _includes/matrix_prod.md
            fi
        fi
    elif [[ $Line =~ \|\ \*\* ]]; then
        echo >> _includes/matrix_prod.md
        echo "$Line **Version** |" >> _includes/matrix_prod.md
    elif [[ $Line =~ \|\ \-\- ]]; then
        echo "$Line ----------- |" >> _includes/matrix_prod.md
    else
        echo >> _includes/matrix_prod.md
        echo "$Line" >> _includes/matrix_prod.md
        if [[ "$Line" == "### Conditional registration" ]]; then
            Check=0
        fi
    fi
done

sed -i '$ s/,$//' servers.json
echo "]" >> servers.json
