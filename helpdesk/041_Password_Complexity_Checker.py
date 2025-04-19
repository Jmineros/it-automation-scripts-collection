CopyEdit
import re

def is_password_strong(password):
pattern = re.compile(r"""
(?=.*[a-z])        # lowercase
(?=.*[A-Z])        # uppercase
(?=.*\d)           # number
(?=.*[!@#$%^&*])   # special character
.{12,}             # at least 12 characters
""", re.VERBOSE)
return bool(pattern.match(password))

# Example use
pw = input("Enter password: ")
print("✅ Strong password" if is_password_strong(pw) else "❌ Weak password")
