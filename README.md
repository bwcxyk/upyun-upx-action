# upyun-upx-action
------
通过[又拍云upx](https://github.com/upyun/upx)推送文件到又拍云的云存储

Example usage

```
name: deploy

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

env:
    TZ: Asia/Shanghai # 设置当前环境时区

jobs:
  deploy:
    runs-on: ubuntu-20.04
    steps:
      - name: Git Configuration
        run: |
          git config --global core.quotePath false
          git config --global core.autocrlf false
          git config --global core.safecrlf true
          git config --global core.ignorecase false
          git config --global user.name "github-actions[bot]"
          git config --global user.email "github-actions[bot]@users.noreply.github.com"
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true
          
      - name: Checkout
        uses: actions/checkout@v3
        with:
          submodules: recursive
          fetch-depth: 0
          
      - name: Build
        run:
          hugo --minify
          
      - name: deploy-upyun
        uses: bwcxyk/upyun-upx-action@1.3
        env:
          UPX_SERVICENAME: ${{ secrets.UPX_SERVICENAME }}
          UPX_OPERATOR: ${{ secrets.UPX_OPERATOR }}
          UPX_PASSWORD: ${{ secrets.UPX_PASSWORD }}
          LOCAL_DIR: public
          REMOTE_DIR: /
```
Environment
| Environment     | Description  |
| --------------- | ------------ |
| UPX_SERVICENAME | 服务名称     |
| UPX_OPERATOR    | 操作员       |
| UPX_PASSWORD    | 操作员密码   |
| LOCAL_DIR       | 本地文件路径 |
| REMOTE_DIR      | 远程文件路径 |

