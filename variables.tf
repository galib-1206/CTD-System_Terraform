variable "region" {
  type    = string
  default = "us-west-2"
}

variable "tag" {
  type    = string
  default = "latest"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# variable "ssh_public_key" {
#   type    = string
#   default = "-----BEGIN RSA PRIVATE KEY-----
# MIIEogIBAAKCAQEAk64H4SjqMpm5Frtvx848uQ2g1iwYMIoV+oiUYVuwOlkpOmAS
# jDKB3yxcYL0++0jCHmKckTEPbah26B1sb4bQ/2yE4btnGX0S55Oq4F1W0CssH4Xp
# pYs1bV16q+RyuebZkUsBU4Vc6aBFIou3U30qsExfOEYA93gs3XQJguu4Pn1dFIfp
# 3NahIi62goXzyiTjlHPqiQEU4/SA/ny5j7sp7LONQ+5H+hT7B5NA5aaLGQp15eKk
# YPlFVTcOtXSSD75+cL53Rss5tk6cfewiyyVXmYaH893mKT7QPvVG/Y31YLPutmQF
# OKJIe9cikfUdsyyyCKE5RAylB3mm4j1+++ZFSQIDAQABAoIBAC9LQIK/E6F40WmS
# RU37oj6xOpzcKjMBReCh9MLpFhrZivaC5e24DxdloX/pm03mEySf9/wXdhVsKghT
# w/JDfpMOMdAIsA/dmjxHciXAPpkT+mFuBVFar5WCplJ+Kq+WWn7JQnd48jRvezSB
# AgjewNkM3EGtSYn3FoclLhabXrnD9hJHbxz/Ehl3pKKAKpUX9OF0+thtejwlID28
# V53qtnsASSXv61W3SqV7C2z8/+HV/dAVS19rB9fk+ewXZKPwlPJY4MEwcxY9yzYt
# c38CvqExwA8RJyNluUeU/wy5w1KrQ8yQ7hM8N9ig/cMyHtQjJqV1PktYwZrJAcP8
# aB1uifECgYEA4tOqZf/a4EbQWA+8sfR8L2fmgbiLQWhtgSlYJJj0ajK/7ViuHv06
# DQ4Wcl60lzYsL12L98mCw9crpVQIULrju6KKUws0uEj6Pc1KL4JcYXNvEpYSk5yZ
# xUdM1iI1vvZECoaBEA2BRuDYI879FhnfDUk9ikO50WCiDf77aTeYqmMCgYEApqxt
# rAMPxKfsRdUJ/O2VdOBea9J06lhbkly4++IDJVWnqDwhjat9lx6MER/x2DAUYz6U
# TWTjK3C3CC2kD9FmYvJVq8tbUfh3oI54wFeW+xPKc/EG6qtSrWvlcdxC/Qihev+T
# ZetuJ3S8E0BDMKb9NDsfIxChg1luAmhtgbdXa2MCgYBgIlWV5Vpes6SZrhHLWlNH
# xEFtuUlL73Z5x4wT9r+gQuIVNgCWIbz4y3+3+WuQquUPLhakbkN9vTRCXdsoXA0o
# +Tqm95jggg2NI/TNLfL5WnM47WHyLez+L7nhB56/0KAF1fvdUdv4rlLs2k1pkI14
# lBIBB7M5ijsks2zaqzWJAQKBgAq6KkzZ3ZfwntpXvc7Tk7zz+9/AqdmzWiFvalB7
# 2Wv7uVCwnhA6K1kglC89+RjK72T70BuzFJPlK0KRfW+vMIHJyw3FhtkdvsVMpiTq
# /kKmoW8Y4jMUV7vlp9zOKlmSxqHd9SSoJGzRrJEon6pv9Pf5niVpmpuTk+r/wZyJ
# qky1AoGAHu+AuWtIn37epLYftR7c7Z0K8Wbg0ilJPa1yJ2QZvqmij2ig33n+XjsV
# Igg2nIlkUrhV0hOS1zIkv+LQit4U7tyx1saRXKeEm8HNmT/k8oJosnyQxdSgNop5
# qaVdx41wA+t79j0e7qXzOOXzArfNdTD+jp8kDWhBjKG8TT6eVQ8=
# -----END RSA PRIVATE KEY-----"
# }

variable "ssl_certificate_arn" {
  type = string
  default = "arn:aws:acm:us-east-1:529587691442:certificate/e19fdbdb-5b90-4e30-9b3a-e95db56f2a43"
}

variable "ssl_certificate_arn_cloudfront" {
  type = string
  default = "arn:aws:acm:us-east-1:529587691442:certificate/e19fdbdb-5b90-4e30-9b3a-e95db56f2a43"
}

variable "cname" {
  type    = string
  default = "_3980225b524ada5ab3c6e0ff9f1fbd8f.ctd.projectsbd.me."
}