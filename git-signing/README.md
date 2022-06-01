How to do git signing
- Create a new GPG key and authorize it through github web
```bash
gpg --full-generate-key
```
Specify a 4096 key
Specify username/email to match GitHub (including name)
```bash
gpg --list-secret-keys --keyid-format=long
```
Using part after the /, export by the following
```bash
gpg --armor --export <key_id>
```
- Specify git to use the signing key
```bash
git config --global user.signingkey <key_id>
```
- Fixing errors:
  - export GPG_TTY=$(tty)
