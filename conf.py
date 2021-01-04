#!/usr/bin/env python
import preprocessing

mysql = {
    "Hostname": "${aws_db_instance.rdsbd.endpoint}",
    "Username": "${aws_db_instance.rdsbd.username}",
    "Password": "${aws_db_instance.rdsbd.password}",
    "Database": "${aws_db_instance.rdsbd.name}",
}
preprocessing_queue = [
    preprocessing.scale_and_center,
    preprocessing.dot_reduction,
    preprocessing.connect_lines,
]
use_anonymous = True