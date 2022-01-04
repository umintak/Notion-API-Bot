db=$(cat $1)
key=$(cat $2)
curl "https://api.notion.com/v1/pages/${db}" \
  -H 'Notion-Version: 2021-08-16' \
  -H "Authorization: Bearer ${key}" \
> retrieve_page_result.json
python parse_and_print.py --j retrieve_page_result.json