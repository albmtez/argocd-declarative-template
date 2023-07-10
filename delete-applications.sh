#!/bin/bash

apps=$(kubectl get applications.argoproj.io | tail -n +2 | awk '{ print $1 }')
for app in $apps; do
    kubectl patch applications.argoproj.io/${app} -p '{"metadata":{"finalizers":[]}}' --type=merge
done