# This script uses https://github.com/gm3dmo/the-power/ to setup a demo org

# download the source files from https://github.com/gm3dmo/the-power/  to ./tmp

git clone https://github.com/gm3dmo/the-power/ --depth 1 --branch=main ./tmp
rm -rf ./tmp/.git

#change directory to .tmp for the remainder of the script
cd ./tmp

echo you should add your enterprise name to the file ./.gh-api-examples.conf

#set new_repo_name
new_repo_name="the-power-repo-$(date +%s)"

# update the text in file ./.gh-api-examples.conf with new_repo_name
sed -i "s/the-power-repo/${new_repo_name}/g" ./tmp/.gh-api-examples.conf

#in .gh-api-examples.conf, set org=MYORG
sed -i "s/org=myorg/org=MYORG/g" ./tmp/.gh-api-examples.conf

#in .gh-api-examples.conf, set enterprise=MYENTERPRISE
sed -i "s/enterprise=ent/enterprise=MYENTERPRISE/g" ./tmp/.gh-api-examples.conf


#echo line with enterprise=" in ./.gh-api-examples.conf
grep enterprise= ./.gh-api-examples.conf
grep org= ./.gh-api-examples.conf

# prompt user to press enter to continue
read -p "Press enter to continue with enterprise and org above, or ctrl-c to exit"

bash ./build-testcase

