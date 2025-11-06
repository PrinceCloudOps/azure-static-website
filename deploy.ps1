$STORAGE="ryanstaticwebtrial2323"
$DEST='$web'

az storage blob upload-batch `
  --account-name $STORAGE `
  --auth-mode login `
  --destination $DEST `
  --source . `
  --pattern *.html `
  --overwrite
