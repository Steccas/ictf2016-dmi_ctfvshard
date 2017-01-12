#!/bin/bash

cat /var/log/audit/audit.log | audit2allow -M new_permissive

semodule -i new_permissive.pp

setenforce 1