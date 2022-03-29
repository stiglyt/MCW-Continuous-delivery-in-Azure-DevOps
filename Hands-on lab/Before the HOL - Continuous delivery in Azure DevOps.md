![Microsoft Cloud Workshops](https://github.com/microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Continuous delivery in Azure DevOps
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
</div>

<div class="MCWHeader3">
November 2021
</div>

Information in this document, including URL and other Internet website references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third-party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2021 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->

- [Continuous Delivery in Azure DevOps before the hands-on lab setup guide](#continuous-delivery-in-azure-devops-before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Create the Project Repo](#task-1-create-the-project-repo)
    - [Task 2: Create GitHub Personal Access Token](#task-2-create-github-personal-access-token)
    - [Task 3: Create Azure DevOps Personal Access Token](#task-3-create-azure-devops-personal-access-token)
    - [Task 4: Create Azure DevOps Project](#task-4-create-azure-devops-project)

<!-- /TOC -->

# Continuous Delivery in Azure DevOps before the hands-on lab setup guide

You should follow all steps in this document *before* performing the Hands-on lab. Pay close attention to product versions, as the version numbers called out in the lab have been tested and shown successful for the lab.

## Requirements

1. Microsoft Azure subscription will be provided for the workshop. If using your own, it must be pay-as-you-go or MSDN.

   - Trial subscriptions will _not_ work

      - To complete this lab setup, ensure your account includes the following:

      - Has the [Owner](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#owner) built-in role for the subscription you use.

      - Is a [Member](https://docs.microsoft.com/azure/active-directory/fundamentals/users-default-permissions#member-and-guest-users) user in the Azure AD tenant you use. (Guest users will not have the necessary permissions.)

2. A Microsoft [GitHub](https://github.com) account.

3. Local machine or a virtual machine configured with:

    - A browser, preferably Chrome for consistency with the lab implementation tests.

4. [Git for Windows](https://gitforwindows.org/)

5. PowerShell

6. [Docker Desktop for Windows](https://www.docker.com/get-started/)

7. [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/)

8. [Node.js](https://nodejs.org/en/download/) (This lab has been tested with Node.js version 16.13.0, which includes npm 8.1.0.)

## Before the hands-on lab

Duration: 60 minutes

You should follow all of the steps provided in this section _before_ taking part in the hands-on lab ahead of time.

### Task 1: Create the Project Repo

In this task, you will create an account in [GitHub](https://github.com) and use `git` to add lab files to a new repository.

1. Create a new repository in GitHub for the lab files.

    - Browse to [GitHub](https://github.com) in your browser and log into your account.

    - Create a new repository.

      - Select the `New` button.

        ![The `New Repository` button in a GitHub profile.](media/b4-task1-step1-1.png "New Repository Button")

      - Provide a name and description for your new repository.

        > **Note**: The suggested name for the repository is `mcw-continuous-delivery-lab-files`.

      - Select `Private` to make this a private repository.

        ![The `New Repository` creation form in GitHub.](media/b4-task1-step1-2.png "New Repository Creation Form")

      - Select the `Create Repository` button to create the new repository. Once the repository is created, you should see the quick setup notes.

        ![The created repository in GitHub. This should reflect the repository that was created.](media/b4-task1-step1-3.png "Created Repository Page")

        > **Note:** Copy the URL for this repository, as you need it for the next step.

2. Clone the lab repository.

- Create an appropriate workspace folder and navigate to it in a PowerShell terminal.

 > **Note**: Suggested name for the workspace folder is `C:\Workspaces\lab`, for example:

 ```pwsh
 C:
 mkdir C:\Workspaces
 cd C:\Workspaces
 mkdir lab
 cd lab
 ```

- You should now be in `C:\Workspaces\lab`. Type the following command and press `<ENTER>`:

 ```pwsh
 git clone https://github.com/stiglyt/MCW-Continuous-delivery-in-Azure-DevOps.git
 ```

- Within the `lab` folder, create a folder for the GitHub repository created in Step 1 and navigate to it in PowerShell.

 ```pwsh
 mkdir mcw-continuous-delivery-lab-files
 cd mcw-continuous-delivery-lab-files
 ```

- You should now be in `C:\Workspaces\lab\mcw-continuous-delivery-lab-files`. The lab files cloned from the Microsoft MCW lab repository should be in `C:\workspaces\lab\mcw-continuous-delivery-in-azure-devops`. Copy the lab files from the Microsoft MCW lab repository to the new folder.

 ```pwsh
 Copy-Item '..\mcw-continuous-delivery-in-azure-devops\Hands-on lab\lab-files\*' -Destination ./ -Recurse
 ```

- Initialize the `mcw-continuous-delivery-lab-files` folder as a git repository, commit, and submit contents to remote GitHub branch `main` in the lab files repository created in Step 1.

 > **Note**: The URI of the lab files GitHub repository created in Step 1 will differ from that in the example below.

 ```pwsh
 git init
 git add .
 git commit -m "Initial commit"
 git branch -M main
 git remote add origin https://github.com/YOUR_GITHUB_ACCOUNT/mcw-continuous-delivery-lab-files.git
 git push -u origin main
 ```

### Task 2: Create GitHub Personal Access Token

1. Log in to your GitHub account.

2. Create a Personal Access Token as [described here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token). Ensure the following scopes are checked when configuring your GitHub Personal Access Token:

    - `repo` - Full control of private repositories.
    - `workflow` - Update GitHub Action workflows.
    - `write:packages` - Upload packages to GitHub Package Registry.
    - `delete:packages` - Delete packages from GitHub Package Registry.
    - `read:org` - Read org and team membership, read org projects. This is under the `admin:org` section of scopes.

    ![The configured scopes for a GitHub Personal Access Token.](media/b4-task2-step2-1.png "GitHub Personal Access Token Scope Configuration")

3. Copy the GitHub Personal Access Token somewhere safe and accessible for later use during the lab. **DO NOT COMMIT THIS VALUE TO YOUR REPO!**

    ![The GitHub Personal Access Token. This is a secret value that should be stored somewhere safe and accessible.](media/b4-task2-step3-1.png "Created GitHub Personal Access Token")

You should follow all steps provided *before* performing the Hands-on lab.
