#!/bin/bash

IFS=$'\n'
Lines=$(cat _includes/matrix_base.md)
Check=1

rm _includes/matrix_prod.md

for Line in $Lines
do
    Line=$(echo "$Line" | sed -E "s/\\\\\[(\\^[0-9]+)\\\\\]/\[\1\]/g")
    if [[ $Line =~ \[([0-9a-z-]+\.[0-9a-z]+)\] ]]; then
        raw="${BASH_REMATCH[1]}"
        base=$(curl -Ls -m 10 "https://$raw/.well-known/matrix/server" | jq '."m.server"' | sed s/\"//g)
        if [[ -z "$base" ]] || [[ "$base" == "null" ]]; then
            DNS=$(dig "_matrix._tcp.$raw" SRV +short | sed -E 's/([0-9]+ ){2}//g')
            SRV_PORT=$(echo "$DNS" | grep -oE "^[0-9]+")
            SRV_DOMAIN=$(echo "$DNS" | grep -oE "([a-z0-9]+\.)+$" | sed 's/\.$//')
            if [[ -n "$SRV_DOMAIN" ]]; then
                body=$(curl -Ls -m 10 "https://$SRV_DOMAIN/_matrix/federation/v1/version")
                test=$(echo $body | jq .server)
                reg=$(curl -Ls -m 10 -X POST -H "accept: application/json" -H "Content-Type: application/json" "https://$SRV_DOMAIN/_matrix/client/r0/register" -d '{}')
                if [[ -z "$test" ]] && [[ -n "$SRV_PORT" ]]; then
                    body=$(curl -Ls -m 10 "https://$SRV_DOMAIN:$SRV_PORT/_matrix/federation/v1/version")
                fi
            else
                body=$(curl -Ls -m 10 "https://$raw/_matrix/federation/v1/version")
                reg=$(curl -Ls -m 10 -X POST -H "accept: application/json" -H "Content-Type: application/json" "https://$raw/_matrix/client/r0/register" -d '{}')
                test=$(echo $body | jq .server)
                if [[ -z "$test" ]]; then
                    body=$(curl -Ls -m 10 "https://$raw:8448/_matrix/federation/v1/version")
                fi
            fi
        else
            body=$(curl -Ls -m 10 "https://$base/_matrix/federation/v1/version")
            client=$(curl -Ls -m 10 "https://$raw/.well-known/matrix/client" | jq '."m.homeserver"."base_url"' | sed s/\"//g | sed "s/\/$//g")
            reg=$(curl -Ls -m 10 -X POST -H "accept: application/json" -H "Content-Type: application/json" "$client/_matrix/client/r0/register" -d '{}')
        fi
        name=$(echo $body | jq .server.name | sed s/\"//g)
        version=$(echo $body | jq .server.version | sed s/\"//g)
        closed=$(echo $reg | jq .errcode)
        if [[ $Line =~ \[SSO\] ]] || [[ $Check -eq 0 ]]; then
            closed="null"
        fi
        if [[ "$name" == "Synapse" ]] && [[ -n "$version" ]] && [[ "$closed" != "\"M_FORBIDDEN\"" ]]; then
            echo "$Line $version |" >> _includes/matrix_prod.md
        elif [[ -n "$name" ]] && [[ -n "$version" ]] && [[ "$closed" != "\"M_FORBIDDEN\"" ]]; then
            echo "$Line $name $version |" >> _includes/matrix_prod.md
        elif [[ "$closed" != "\"M_FORBIDDEN\"" ]]; then
            echo "$Line Error!! |" >> _includes/matrix_prod.md
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
