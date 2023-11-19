GH_SOURCE_ORG="our-ghec-org1"
GH_TARGET_ORG="our-ghec-org1-migrated"
GH_TARGET_ENTERPRISE="stucorpemu"

gh gei migrate-org --github-source-org $GH_SOURCE_ORG --github-target-org $GH_TARGET_ORG \
--github-target-enterprise $GH_TARGET_ENTERPRISE

# Reclaiming mannequins
# https://docs.github.com/en/enterprise-cloud@latest/migrations/using-github-enterprise-importer/completing-your-migration-with-github-enterprise-importer/reclaiming-mannequins-for-github-enterprise-importer#reclaiming-mannequins

# Generate a list of mannequins
gh gei generate-mannequin-csv --github-target-org $GH_TARGET_ORG --output $GH_TARGET_ORG-mannequin.csv

# pause and  ask user to update the csv file with the correct user names in the target org
echo "Please update the $GH_TARGET_ORG-mannequin.csv file with the correct user names in the target org"
read -p "Press enter to continue"

# reclaim the mannquins
gh gei reclaim-mannequin --github-target-org $GH_TARGET_ORG --csv $GH_TARGET_ORG-mannequin.csv

# https://docs.github.com/en/enterprise-cloud@latest/migrations/using-github-enterprise-importer/completing-your-migration-with-github-enterprise-importer/reclaiming-mannequins-for-github-enterprise-importer#managing-authorship-for-git-commits
echo Git commits are not linked to mannequins, so you will see the original author of the commit in the Git history.
