import json
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--j', type=str)

args = parser.parse_args()

with open(args.j, "rb") as f:
    d = json.load(f)

for result in d["results"]:
    print(json.dumps(result["properties"]["날짜"], indent=2))