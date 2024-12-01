
GH_SOURCE_ORG="ghes-org1"
GH_SOURCE_REPO="repo1"
GH_DESTINATION_ORG="stucorpemu-migration"
GH_DESTINATION_REPO="migrated-org1"
GHES_API_URL="https://https://gitstua-0bc3a9e8b10d29153.gh-quality.net/api/v3"

AZURE_STORAGE_CONNECTION_STRING="tbc"

gh gei migrate-repo --github-source-org $GH_SOURCE_ORG --source-repo $GH_SOURCE_REPO --github-target-org $GH_DESTINATION_ORG --target-repo $GH_DESTINATION_REPO \
    --ghes-api-url $GHES-API-URL --azure-storage-connection-string $AZURE_STORAGE_CONNECTION_STRING


# gh gei migrate-org --github-source-org $GH_SOURCE_ORG --github-target-org $GH_TARGET_ORG \
# --github-target-enterprise $GH_TARGET_ENTERPRISE

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
