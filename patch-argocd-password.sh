#!/bin/bash

# Patches the argocd admin password to 'argocdadmin' value
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2y$10$RRIcojJJ5GdJQKXLi7EZiOF9dv3nzMPP.ZdAYfNokCu6uP3KnESYG",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
