db=$(cat $1)
key=$(cat $2)
curl -X POST "https://api.notion.com/v1/databases/${db}/query" \
-H "Authorization: Bearer ${key}" \
-H 'Notion-Version: 2021-08-16' \
-H "Content-Type: application/json" \
--data '{
    "filter":
        {
            "property": "날짜",
            "date": {
                    "equals": "2021-11-30"
            }
        }
    ,
    "sorts": [
        {
            "timestamp": "created_time",
            "direction": "descending"
        }
    ]
}' \
> query_result.json
python parse_and_print.py --j query_result.json