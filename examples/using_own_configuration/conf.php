[main]
name = "Google PrivateBin"
discussion = true
opendiscussion = false
password = true
fileupload = true
burnafterreadingselected = false
defaultformatter = "plaintext"
sizelimit = 10485760
template = "bootstrap"
languageselection = false

[expire]
default = "1day"

[expire_options]
5min = 300
10min = 600
1hour = 3600
1day = 86400
1week = 604800
1month = 2592000

[formatter_options]
plaintext = "Plain Text"
syntaxhighlighting = "Source Code"
markdown = "Markdown"

[traffic]
limit = 0

[purge]
limit = 600
batchsize = 10

[model]
class = GoogleCloudStorage

[model_options]
bucket = "${privatebin_bucket_name}"
