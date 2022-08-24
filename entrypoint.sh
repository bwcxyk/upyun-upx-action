#!/bin/bash

upx login ${{ secrets.UP_BUCKET }} ${{ secrets.UP_OPERATOR }} ${{ secrets.UP_OPERATOR_PASSWORD }}
