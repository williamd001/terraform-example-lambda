#!/usr/bin/env bash

for dir in resources/lambdas/*
do
  npx tsc --project $dir
done