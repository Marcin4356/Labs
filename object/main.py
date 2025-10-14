from user import User
from post import Post

app_user_one = User("mm@mm.com", "mmm mmm", "whoami", "jobrole")
app_user_one.get_user_info()

app_user_two = User("ssss@ss.com", "sss mmm", "who", "jobroletraine")
app_user_two.get_user_info()

new_post = Post("on a lesson", app_user_two.name)
new_post.get_post_info()