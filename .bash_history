sudo apt update
sudo apt upgrade 
sudo apt install update-motd
anaonimichael@DESKTOP-DEFAI08:~$
mkdir wanaoni-website
cd wanaoni-website
mkdir html
nano html/index.html
nano docker-compose.yml
docker-compose up
sudo docker-compose up
git clone https://github.com/wanaonimike/wanaoni-family.git
cd wanaoni-family
cp -r ../wanaoni-website/html/* .
cp -r ../../html/* .
ls ../../html
find ~/ -type d -name "html"
cp -r ../html/* .
git add .
git commit -m "Add HTML content for GitHub Pages"
git push origin main
git config --global credential.helper cache
git push origin main
ls ~/Downloads
ls /mnt/c/Users/
ls /mnt/c/Users/mike/Downloads
cd ~/wanaoni-website/wanaoni-family
cp /mnt/c/Users/mike/Downloads/flexbox-template.zip .
unzip flexbox-template.zip
git add .
git commit -m "Add Flexbox template to wanaoni-family site"
git push origin main
ls /mnt/c/Users/mike/Downloads
ls -l /mnt/c/Users/mike/Downloads | grep welfare
# Step 1: Go to your working directory
cd ~/wanaoni-website/wanaoni-family
# Step 2: Copy the zip file from Downloads
cp /mnt/c/Users/mike/Downloads/welfare-gh-pages.zip .
# Step 3: Unzip the file
unzip welfare-gh-pages.zip
# Step 4: (Optional) Move contents if they are inside a folder
ls
# If you see a folder like 'welfare-gh-pages', move its contents:
mv welfare-gh-pages/* .
rmdir welfare-gh-pages
ls -l index.html
pwd && ls -l | grep index
git init
git remote add origin https://github.com/wanaonimike/wanaoni-family.git
git add .
git commit -m "Deploy enhanced index to GitHub Pages"
git push -u origin main
unzip wanaoni_family_welfare.zip
mv ~/Downloads/wanaoni_family_welfare.zip ~/wanaoni-website/wanaoni-family/
find ~ -name "wanaoni_family_welfare.zip"
ls /mnt/c/Users/mike/Downloads
mv /mnt/c/Users/mike/Downloads/welfare_template.zip ~/wanaoni-website/wanaoni-family/
cd ~/wanaoni-website/wanaoni-family/
unzip welfare_template.zip
_file welfare_template.zip
unzip /mnt/c/Users/mike/Downloads/welfare-gh-pages.zip
mv /mnt/c/Users/mike/Downloads/welfare-gh-pages.zip ~/wanaoni-website/wanaoni-family/
pwd && ls -l | grep index
git add index.html
git commit -m "Add new Wanaoni Family Welfare homepage"
git push origin main
git add .
git commit -m "Add new Wanaoni Family Welfare homepage and supporting files"
git push origin main
npm install -g sass
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get remove libnode-dev
sudo apt-get install -f
sudo apt-get install -y nodejs
node -v
npm -v
sudo npm install -g sass
"scripts": {
}
npm init -y
nano package.json
npm run sass
@import "abstracts/variables";
@import "base/typography";
@import "components/buttons";
@import "layout/header";
@import "layout/footer";
nano scss/style.scss
npm run sass
nano package.json
nano scss/style.scss
npm run sass
nano scss/style.scss
npm run sass
nano scss/style.scss
npm run sass
nano scss/style.scss
npm run sass
ls scss/abstracts/
npm run sass
ls scss/abstracts/
npm run sass
sass --load-path=scss scss/style.scss css/style.css --watch
wanaoni-family/
├── scss/
│   ├── style.scss
│   └── abstracts/
ls -R scss
@use "bootstrap/variables";
nano scss/style.scss
sass --load-path=scss scss/style.scss css/style.css --watch
nano scss/style.scss
npm run sass
nano scss/style.scss
npm run sass
@use "bootstrap/functions";
@use "bootstrap/variables" with (
);
@use "bootstrap";
nano scss/style.scss
npm run sass
nano scss/style.scss
npm run sass
nano scss/style.scss
npm run sass
nano scss/style.scss
npm run sass
npm run sass
npm init -y
npm run sass
FROM nginx:alpine
COPY ./html /usr/share/nginx/html
wanaonimichael@DESKTOP-DEFAI08:~$ FROM nginx:alpine
FROM: command not found
wanaonimichael@DESKTOP-DEFAI08:~$ COPY ./html /usr/share/nginx/html
COPY: command not found
wanaonimichael@DESKTOP-DEFAI08:~$
mkdir wanaoni-website
cd wanaoni-website
nano html/index.html
nano Dockerfile
nano docker-compose.yml
docker-compose up --build
sudo usermod -aG docker $USER
docker-compose up --build
sudo usermod -aG docker $USER
log out
sudo reboot
docker-compose up --build
