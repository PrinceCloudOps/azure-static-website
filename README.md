<p align="center">
  <a href="https://www.loom.com/share/7789d533aaa84e31bfee6b9c0d4aa7b9">
    <img src="./thumbnail.png" width="850" style="border-radius: 10px;"><img width="1397" height="730" alt="Thumbnail (2)" src="https://github.com/user-attachments/assets/41d2f14f-b446-458f-a6a2-b0d4b362cb19" />

  </a>
</p>

# Azure Static Website Deployment (Blob Storage + RBAC + One-Command Deploy)

**🔗 Live Site:** https://ryanstaticwebtrial2323.z13.web.core.windows.net/?v=9  
**🎥 Watch Me Build It!:** https://www.loom.com/share/7789d533aaa84e31bfee6b9c0d4aa7b9

---

## 📌 Overview

This project demonstrates how to host a static website using **Azure Blob Storage's static website feature**, and how to **update the site automatically using a version-controlled deployment script**.

This shows understanding of:
- Cloud **object storage**
- **Public website hosting** on Azure
- **RBAC vs Shared Key** (modern access control)
- **CI/CD workflow fundamentals**
- **Repeatable deployment automation**

This is the **production-aligned** way to host and maintain static web assets in Azure.

---

## 🧱 Architecture

| Component | Purpose |
|----------|---------|
| **Storage Account** | Base resource hosting the website files |
| **$web Container** | Special container for static website public hosting |
| **Static Website Feature** | Handles routing for index + 404 pages |
| **Azure CLI Deploy Script** | Automates updates to the live site |
| **GitHub Version Control** | Tracks changes and maintains deployment history |

---

## 🗂️ Project Structure

**index.html**  
- Main homepage displayed when users visit the site.

**404.html**  
- Custom error page shown for invalid routes.

**deploy.ps1**  
- One-command deployment script that uploads updated website files to Azure Blob Storage using Azure CLI + RBAC authentication.



## 🚀 Deploy / Update the Site (One Command)

### Step 1 — Login to Azure
az login

### Step 2 — Run the Deploy Script
.\deploy.ps1

This uploads all .html files to the $web container and updates the live site instantly — no clicking, no portal uploads.

Script Reference:$STORAGE="ryanstaticwebtrial2323"
$DEST='$web'

az storage blob upload-batch `
  --account-name $STORAGE `
  --auth-mode login `
  --destination $DEST `
  --source . `
  --pattern *.html `
  --overwrite

| Check                              | Status |
| ---------------------------------- | ------ |
| Homepage loads                     | ✔️     |
| 404 fallback page works            | ✔️     |
| Updates deploy using script        | ✔️     |
| No access keys used (RBAC instead) | ✔️     |

404 Test: https://ryanstaticwebtrial2323.z13.web.core.windows.net/does-not-exist

---

🧹 Cleanup (to avoid charges)

Delete the resource group: az group delete -n rg-static-web-trial --yes --no-wait


| Enhancement                                  | Skill Demonstrated             |
| -------------------------------------------- | ------------------------------ |
| Add custom domain + HTTPS (Azure Front Door) | CDN + SSL acceleration         |
| Replace deploy script with GitHub Actions    | Full CI/CD pipeline            |
| Add storage lifecycle rules                  | Cost governance & data tiering |

---

## 🔄 Next Enhancements (Roadmap)

| Enhancement | Purpose | Skill Area |
|------------|---------|------------|
| Add GitHub Actions Workflow for Auto Deploy | Removes manual script execution | CI/CD |
| Add Custom Domain + HTTPS via Azure CDN | Production-grade hosting | Networking & Certificates |
| Convert HTML to React Frontend | Modern front-end architecture | Web App Engineering |
