curl 'https://api.notion.com/v1/pages/1350e12a188f489da834480260a98221' \
  -H 'Authorization: Bearer secret_AiGCVcJHfuRpKdnX59TRAqUCXHOM1ypTYZK8ChjBgwF' \
  -H "Content-Type: application/json" \
  -H "Notion-Version: 2021-08-16" \
  -X PATCH \
    --data '{
  "properties": {
    "이름": {
        "title": [
            {
                "text": {
                      "content": "야호"
                }
            }
        ]
    },
    "태그": {
        "select": {
                "name": "이슈"
        }
    }
  }
}' \
> retrieve_page_result.json
python parse_and_print.py --j retrieve_page_result.json