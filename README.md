# upyun-upx-action
> 又拍云目前已支持S3协议，推荐使用jakejarvis/s3-sync-action
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
        uses: bwcxyk/upyun-upx-action@1.2
        env:
          bucket: ${{ secrets.BUCKET }}
          operator: ${{ secrets.OPERATOR }}
          operator_password: ${{ secrets.OPERATOR_PASSWORD }}
          local_path: ./public/
          remote_path: /
```
Environment
| Environment       | Description  |
| ----------------- | ------------ |
| BUCKET            | 服务名称     |
| OPERATOR          | 操作员       |
| OPERATOR_PASSWORD | 操作员密码   |
| local_path        | 本地文件路径 |
| remote_path       | 远程文件路径 |

