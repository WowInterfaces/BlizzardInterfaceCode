#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import requests
from tqdm import tqdm
import pandas as pd

os.environ["http_proxy"] = "http://127.0.0.1:1080"
os.environ["https_proxy"] = "http://127.0.0.1:1080"

table_name = "GlobalStrings"
game_build = "3.4.5.61937"
locales = ["enUS", "deDE", "esES", "frFR", "ruRU", "zhCN", "zhTW", "koKR"]
# locales = ["enUS", "zhCN", "zhTW"]

base_url = f"https://wago.tools/db2/{table_name}/csv?build={game_build}"

def dowload_csv(url, csv_file):
    if os.path.exists(csv_file):
        print(f"File {csv_file} already exists, skipping")
        return
    print("Downloading %s" % url)
    response = requests.get(url, stream=True)
    total_size = int(response.headers.get("content-length", 0))
    with open(csv_file, "wb") as f:
        for chunk in tqdm(response.iter_content(chunk_size=1024), total=total_size // 1024, unit='B', unit_scale=True, desc="Downloading"):
            if chunk:
                f.write(chunk)

def convert_csv_to_lua(csv_file, lua_file):
    # if os.path.exists(lua_file):
    #     print(f"File {lua_file} already exists, skipping")
    #     return
    print("Converting %s to %s..." % (csv_file, lua_file))
    df = pd.read_csv(csv_file, encoding="utf-8")
    with open(lua_file, "w", encoding="utf-8") as f:
        for _, row in df.iterrows():
            if len(row) >= 3:
                key = str(row.iloc[1])
                value = str(row.iloc[2])
                if "\n" in value or "\"" in value:
                    value = "[[%s]]" % value        # for multi-line
                else:
                    value = "\"%s\"" % value        # for single-line
                # Escape characters
                if r'-' in key:
                    key = re.sub(r'-', r'_', key)
                if r'\|' in value:
                    value = re.sub(r'\\\|', r'\\\|', value)
                f.write(f"{key} = {value};\n")

for locale in locales:
    if locale == "enUS":
        url = base_url
    else:
        url = base_url + "&locale=" + locale

    csv_dir = os.path.join(os.path.curdir, "csv")
    csv_file = f"{table_name}.{locale}.csv"
    lua_file = f"{table_name}.{locale}.lua"
    
    os.makedirs(csv_dir, exist_ok=True)
    csv_file = os.path.join(csv_dir, csv_file)
    
    dowload_csv(url, csv_file)
    convert_csv_to_lua(csv_file, lua_file)
