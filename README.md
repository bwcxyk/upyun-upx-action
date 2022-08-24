# upyun-upx-action
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

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      -
        name: Checkout
        uses: actions/checkout@v2
      - 
        name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true
      -
        name: Build
        run: hugo --minify
      -
        name: deploy-upyun
        uses: bwcxyk/upyun-upx-action@main
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

