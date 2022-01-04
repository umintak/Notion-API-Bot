db=$(cat mydb.id)
key=$(cat my.key)
curl --location --request PATCH "https://api.notion.com/v1/databases/${db}" \
--header "Authorization: Bearer ${key}" \
--header 'Content-Type: application/json' \
--header 'Notion-Version: 2021-08-16' \
--data '{
    "title": [
        {
            "text": {
                "content": "test"
            }
        }
    ],
    "properties": {
        "테스트": {
            "multi_select": {
                "options": [
                    {
                        "name": "Duc Loi Market"
                    },
                    {
                        "name": "Rainbow Grocery"
                    },
                    {
                        "name": "Gus'\''s Community Market"
                    },
                    {
                        "name": "The Good Life Grocery",
                        "color": "orange"
                    }
                ]
            }
        },
        "이름dd": {
            "name": "이름"
        }
    }       
}' \
> patch.json
python parse_and_print.py --j patch.json
