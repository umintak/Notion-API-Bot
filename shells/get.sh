db=$(cat $1)
key=$(cat $2)
curl "https://api.notion.com/v1/databases/${db}" \
-H "Authorization: Bearer ${key}" \
-H 'Notion-Version: 2021-08-16' \
> get_result_2.json
python parse_and_print.py --j get_result_2.json
