#!/usr/bin/env sh

for dir in resources/lambdas/*
do
  npx tsc --project $dir
done