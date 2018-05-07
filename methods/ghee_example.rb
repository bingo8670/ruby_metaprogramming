# 获取某个用户的 gist（发布到GitHub 的代码片段）
require "ghee"

gh = Ghee.basic_auth("usr", "pwd")    # 你的GitHub用户名和密码
all_gists = gh.users("nusco").gists
a_gist = all_gists[20]

a_gist.url
a_gist.description

a_gist.star
