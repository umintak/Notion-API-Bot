w=$(python3 get_query.py --data w)
db=$(cat $1)
key=$(cat $2)

curl -X POST "https://api.notion.com/v1/databases/${db}/query" \
-H "Authorization: Bearer ${key}" \
-H 'Notion-Version: 2021-08-16' \
-H "Content-Type: application/json" \
--data "${w}" \
> query_result.json
python parse_and_print.py --j query_result.json