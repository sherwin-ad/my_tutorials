# AZ-400 Practice Exam

1. You manage the deployment of an Azure App Service web app named App1 to multiple Azure regions.

   You need to identify which Azure service enables you to validate the availability of App1 from multiple locations around the world.

   What should you identify?

   Select only one answer.

   - **Application Insights**

   - Azure Advisor

   - Azure App Configuration

   - Azure Service Health

   Application Insights includes a built-in functionality that allows you to validate the availability of an app from multiple locations around the world. App Configuration is a key/value store that you can use to facilitate the implementation of feature flags. Azure Advisor detects misconfiguration issues. Azure Service Health provides information about the status of platform services, not individual apps.

   [Monitor app performance - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/monitor-app-performance/)

   [Application Insights availability tests - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/app/availability-overview)

2. You manage the deployment of an Azure App Service web app named App1 to multiple on-premises locations.

   You plan to implement Application Insights to monitor App1.

   You need to authorize App1 to access an Application Insights resource.

   Which authorization method should you use?

   Select only one answer.

   - access key

   - **instrumentation key**

   - Microsoft Entra managed identity

   - Microsoft Entra security principal

   An instrumentation key is used to authorize access to an Application Insights resource. An access key is used to authorize access to an Azure Storage account. Microsoft Entra security principals and managed identities are not supported for authorizing access to an Application Insights resource.

   [Explore Application Insights - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/monitor-app-performance/3-application-insights-overview)

   [Application Insights overview - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview?tabs=net)

3. You plan to deploy a web-based solution by using Azure App Service and Azure DevOps.

   You need to track build and release information on an Application Insights dashboard.

   What should you use?

   Select only one answer.

   - Azure Monitor

   - continuous monitoring

   - GitHub Actions

   - **release annotations**

   Release annotations allow the integration of Azure DevOps and Application Insights, showing build and release-related information to detect performance impact. Azure Monitor can be used in release pipelines to detect whether active alerts are triggered and block or allow the next step. GitHub Actions are used to trigger an Azure pipeline to run directly from a GitHub Actions workflow. Continuous monitoring allows you to add preconditions and postconditions, but not to send information to Application Insights.

   [Release annotations for Application Insights - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/app/annotations)

   [How Azure Monitor works - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/intro-to-azure-monitor/3-how-azure-monitor-works)

4. You collect performance logs from an Azure virtual machine named VM1 by using Log Analytics.

   You have a Kusto Query Language (KQL) query that displays the results of the log-based performance data in a tabular format.

   You need to modify the query to display the results as a bar chart.

   Which KQL operator should you use?

   Select only one answer.

   - project
   - project-away
   - **render**
   - summarize

   The `render` operator allows you to display the results of a query as a bar chart. The `project` operator allows you to specify the columns to include in a result set. The `project-away` operator allows you to specify which columns to exclude from a result set. The `summarize` operator aggregates the results.

   [Exercise - Visualize data with the render operator - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/gain-insights-data-kusto-query-language/5-exercise-visualize-data-render-operator)

   [render operator - Azure Data Explorer | Microsoft Learn](https://learn.microsoft.com/azure/data-explorer/kusto/query/renderoperator?pivots=azuredataexplorer)

5. You implement the monitoring of a distributed application named App1 by using Application Insights.

   You need to identify aggregated data, including rates of requests, failures, and exceptions. The solution must minimize the amount of time and effort required to retrieve the relevant information.

   Which Application Insights feature should you use?

   Select only one answer.

   - Application Map
   - **metrics explorer**
   - Profiler
   - usage analysis

   Metrics explorer provides direct access to aggregated data, including rates of requests, failures, and exceptions. Application Map lists the components of an app, including key metrics and alerts, but it does not provide direct access to aggregated data. Profiler allows you to inspect execution profiles of sampled requests. Usage analysis allows you to analyze user segmentation and retention.

   [Explore Application Insights - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-tools-track-usage-flow/6-explore-application-insights)

   [Log-based and pre-aggregated metrics in Application Insights - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/app/pre-aggregated-metrics-log-metrics)

6. You have an Azure subscription named Sub1.

   You configure Azure Activity Log events to be stored in the AzureActivity table in a Log Analytics workspace.

   You need to create a Kusto Query Language (KQL) query that will display only specific columns in the AzureActivity table.

   Which KQL operator should you use to specify the names of the columns to be included in the results of the query?

   Select only one answer.

   - **project**
   - reduce
   - take
   - where

   The `project` operator is used to select columns to be seen in the output. The `reduce` operator groups strings together based on value similarity. The `where` operator filters to a subset of rows. The `take` operator specifies the number of rows to be returned, not which columns.

   [Write your first query with Kusto Query Language - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/write-first-query-kusto-query-language/)

   [Project operator - Azure Data Explorer | Microsoft Learn](https://learn.microsoft.com/azure/data-explorer/kusto/query/projectoperator)

   [Azure Activity Log event schema - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/essentials/activity-log-schema)

7. You use Git Bash to clone a Git repository to a Windows server.

   You plan to implement a custom Git hook shell script that will be triggered automatically when the `commit` command is invoked in the repository.

   You need to add content to the first line of the script.

   What should you add?

   Select only one answer.

   - #!/bin/sh
   - #!\bin\sh
   - **#!C:/Program\ Files/Git/usr/bin/sh.exe**
   - #!C:\Program Files\Git\usr\bin\sh.exe

   To execute any of the Git hook scripts by using Git shell, the existing line of `#!/bin/sh` must be replaced with one that points to the location of the Bash script interpreter. On any Windows operating system, the notation must use the forward slashes and an escape character to account for the space character in the path.

   [Implement Git hooks - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/explore-git-hooks/3-implement)

   [Service hooks events - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/service-hooks/events?view=azure-devops)

8. You clone a Git repository to a Linux server.

   You plan to implement a Git hook that will be triggered automatically when the `commit` command is invoked in the repository.

   You need to use one of the predefined Git hook files.

   What should you do to ensure that the predefined file will be executed?

   Select only one answer.

   - Add an extension to the script file.
   - Modify the location of the file.
   - Modify the permissions of the file.
   - **Remove the extension from the script file.**

   To ensure that the predefined Git hook script can be executed, you must remove its existing extension (.sample), rather than adding the extension. On a Windows server, there is no need to modify the existing permissions of the script file. The file must reside in its default location.

   [Implement Git hooks - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/explore-git-hooks/3-implement)

9. You have a project in Azure DevOps named Project1 that uses a private Git repository. The use of personal access tokens (PAT) and Git Credential Manager are **NOT** allowed.

   You plan to clone the Git repository from a Windows computer with Git for Windows installed.

   You need to identify which mechanism you should use to authenticate to Project1 when cloning the repository. The solution must maximize security.

   Which authentication mechanism should you identify?

   Select only one answer.

   - Kerberos

   - Managed identity

   - OAuth

   - **SSH**

   SSH authentication is used when Git Credential Manager or PATs are not allowed. Managed identity applies to authenticating Azure resources. OAuth is used for REST APIs only. Kerberos is used for Active Directory deployments only.

   [Guidance for authentication - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/integrate/get-started/authentication/authentication-guidance?view=azure-devops)

   [About security, authentication, authorization, and security policies - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/organizations/security/about-security-identity?view=azure-devops#authentication-methods-integrating-with-other-services-and-apps)

   [Manage Git repositories - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-git-repositories/)

   [Use SSH key authentication - Azure Repos | Microsoft Learn](https://learn.microsoft.com/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops)

10. Your team uses clones of an Azure DevOps Git repository to collaborate on a shared project. Commits pushed to the repository include large binary files.

   A new employee joins the team and clones the repository but cannot find any large binary files in the local clone. All the other team members can locate large binary files in their local clones.

   You need to recommend a solution that will enable the new employee to locate the large binary files after creating a local clone.

   What should you recommend?

   Select only one answer.

   - Ask the employee to run `az repos create`.
   - Ask the employee to run `git clone git@ssh.dev.azure.com`.
   - Install the GitX client on the new employee’s computer.
   - **Install the Git LFS client on the new employee’s computer.**

   The Git LFS client must be installed and configured properly to allow you to see binary committed files. `az repos create` creates a new Git repository by using Azure Repos. `git clone git@ssh.dev.azure.com` clones a repository by using SSH, which is unsupported in Azure Repos when Git LFS is used to track files. GitX is a Git extension that provides an improved development workflow.

   [Manage Git repositories - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-git-repositories/)

   [Work with large files in your Git repo - Azure Repos | Microsoft Learn](https://learn.microsoft.com/azure/devops/repos/git/manage-large-files?view=azure-devops#limitations)

11. You plan a Git branching strategy for your company.

    You need to ensure that the strategy will allow individual developers to have their own server-side repository.

    Which branching strategy should you use?

    Select only one answer.

    - centralized 
    - **forking**
    - GitFlow 
    - trunk-based

    A forking workflow is the only Git-based workflow in which each developer has their own server-side repository. For all others, developers share the same server-side repository.

    [Explore branch workflow types - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-git-branches-workflows/2-explore-branch-workflow-types)

    [Branch strategically - Azure Repos | Microsoft Learn](https://learn.microsoft.com/azure/devops/repos/tfvc/branch-strategically?view=azure-devops)

12. You plan to use a trunk-based development workflow as the Git branching strategy for your company.

    You are documenting the steps of the workflow.

    You need to identify the step that immediately follows creating a feature branch.

    Which step should you identify?

    Select only one answer.

    - **adding commits**

    - code review

    - deployment

    - opening a pull request

    Adding commits follows creating a feature branch in a trunk-based development workflow. Opening a pull request follows adding commits to a trunk-based development workflow. Code review follows opening a pull request in a trunk-based development workflow. Deployment follows code review in a trunk-based development workflow.

    [Explore feature branch workflow - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-git-branches-workflows/3-explore-feature-branch-workflow)

13. You plan to use a forking workflow as the Git branching strategy for your company.

    You need to identify the minimum number of repositories that each developer should use.

    What is the minimum number of repositories you should identify?

    Select only one answer.

    - 1
    - **2**
    - 3
    - 4

    When using a forking workflow, each developer should have two repositories, one private local side and the other public server-side. While it is technically possible to use only a server-side repository, this violates the principle of the forking workflow.

    [Explore branch workflow types - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-git-branches-workflows/2-explore-branch-workflow-types)

    [Fork your repository - Azure Repos | Microsoft Learn](https://learn.microsoft.com/azure/devops/repos/git/forks?view=azure-devops&tabs=visual-studio)

14. You have an Azure DevOps Agile-based project that includes several team members who use build and release pipelines based on continuous integration.

    You notice that some pull requests are not associated with requirements captured by user stories.

    You need to ensure that pull requests are blocked unless such an association exists.

    Which branch policy you should implement?

    Select only one answer.

    - Automatically include code reviewers.

    - Check for comment resolution.

    - **Check for linked work items.**

    - Require a minimum number of reviewers.

    In Agile projects, requirements are implemented as User Story work item types. You can require associations between pull requests and work items. Linking work items provides more context for changes and ensures that updates go through your work item tracking process. Requiring a minimum number of reviewers is not used to link a work item with a pull request. Checking for comment resolution is useful to verify that reviewers’ comments are resolved, but not to link a work item with a pull request. A policy can be defined to include specific reviewers, but it cannot link a work item to the pull request.

    [Use branching and merging with Git for Business Central - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/use-branch-merge-git/)

    [Collaborate with pull requests in Azure Repos - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/collaborate-pull-requests-azure-repos/)

    [Git branch policies and settings - Azure Repos | Microsoft Learn](https://learn.microsoft.com/azure/devops/repos/git/branch-policies?view=azure-devops&tabs=browser#check-for-linked-work-items)

15. You have an Azure Repos repository named Repo1 and a GitHub-based repository named Repo2.

    You plan to create a YAML pipeline that will use artifacts stored in Repo1 and Repo2.

    You need to identify which step should be included in the pipeline.

    Which step should you identify?

    Select only one answer.

    - **checkout**
    - pool
    - script
    - trigger

    The `checkout` step is required to gain access to repositories from a YAML pipeline. The `trigger`, `pool`, and `script` steps are all optional in this scenario. They are not required to gain access to repositories from a YAML pipeline.

    [Use multiple repositories in your pipeline - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/integrate-azure-pipelines/6-use-multiple-repositories-your-pipeline)

16. You plan to configure GitHub Actions to access GitHub secrets.

    You have the following YAML.

    ```
    01  steps:
    02    - shell: pwsh
    03    
    04        DB_PASSWORD: ${{ secrets.DBPassword }}
    ```

    You need to complete the YAML to reference the secret. The solution must minimize the possibility of exposing secrets.

    Which element should you use at line 03?

    Select only one answer.

    - args:
    - $env:
    - **env:**
    - run:

    The most secure way to pass secrets to run commands is to reference them as environment variables, rather than arguments. This requires the use of the `env:` element. The `$env:` notation is used to reference an environment variable, but the intention of this question is to define rather than reference. The `run:` element defines which command to run, so it follows the `env:` notation.

    [Use secrets in a workflow - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/learn-continuous-integration-github-actions/9-use-secrets-workflow)

17. You have a GitHub organization that contains a single repository.

    You plan to implement a GitHub workflow that will consist of multiple actions, each of which will include multiple steps. Some of the steps will require the use of a secret.

    You need to identify two locations where the secret can be created.

    Which two locations should you identify? Each correct answer presents a complete solution.

    Select all answers that apply.

    - action

    - **organization**

    - **repository**

    - step

    - workflow

    GitHub secrets can be created at the organization and repository levels. You can use secrets in a step of an action within a workflow, but you cannot create them at any of the other three levels.

    [Create encrypted secrets - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/learn-continuous-integration-github-actions/8-create-encrypted-secrets)

18. You manage Azure Pipelines.

    You plan to implement a self-hosted agent pool.

    You need to configure the authentication method to connect the computers in the agent pool to Azure Pipelines.

    Which authentication method should you use?

    Select only one answer.

    - Microsoft Entra managed identity
    - Microsoft Entra service principal
    - **personal access token (PAT)**
    - shared access signature (SAS)

    A PAT is used to connect a self-hosted agent to Azure Pipelines. A SAS is used to authorize access to Azure Storage, which is not applicable in this scenario. Microsoft Entra service principals and managed identities do not support connecting self-hosted agents to Azure Pipelines.

    [Integrate with Azure Pipelines - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/integrate-azure-pipelines/)

    [Use personal access tokens - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows)

19. You have an Azure DevOps organization named Organization1 that contains a project named Project1. Project1 contains a CI/CD YAML pipeline named Pipeline1 that deploys resources to an Azure subscription.

    You need to ensure that an attempt to access the subscription from any YAML pipelines other than Pipeline1 must be explicitly authorized.

    What should you configure?

    Select only one answer.

    - Microsoft Entra managed identity
    - Organization permissions
    - **Pipeline permissions**
    - Project permissions

    Using Pipeline permissions, you can specify which pipeline can consume the service connection. If any other YAML pipelines refer to the service connection, an authorization request is raised, which must be approved by a connection administrator. Project permissions are used to control service connection sharing between projects but not for pipelines. Organization permissions define security groups that control the service connections within an organization. A Microsoft Entra managed identity is used instead of a service principal for a service connection, but not to request approval to use the service connection.

    [Service connections in Azure Pipelines - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#pipeline-permissions)

    [Provision and test environments - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-provision-environments/)

20. You have an Azure DevOps project that contains a YAML pipeline named Pipeline1. Pipeline1 deploys an artifact to an Azure subscription named Sub1. Sub1 contains an Azure Key Vault named Vault1.

    You plan to configure Pipeline1 to retrieve a password stored in Vault1. You add a key vault v2 task to Pipeline1.

    You need configure the key vault v2 task to reference the password to be retrieved from Vault1.

    What should you include in the key vault v2 task?

    Select only one answer.

    - connectedServiceName
    - runAsPreJob
    - secret
    - **secretsFilter**

    `secretsFilter` provides a default value of *, which allows you to download all the secrets or a comma-separated list of secret names. `runAsPreJob` exposes secrets to all the tasks in a job, not just the tasks that follow. `connectedServiceName` selects the service connection for the Azure subscription that contains the Key Vault instance or creates a new connection. Secret is not an argument of a YAML pipeline. It is an option of the Azure pipeline CLI to create a variable and mark it as a secret.

    [AzureKeyVault@2 - Azure Key Vault v2 task | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/tasks/reference/azure-key-vault-v2?view=azure-pipelines&viewFallbackFrom=azure-devops#arguments)

    [Manage secrets in your server apps with Azure Key Vault - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-secrets-with-azure-key-vault/)

21. You have a GitHub project that uses Open Source Software (OSS).

    You need to implement a solution that evaluates OSS packages for license compliance issues and vulnerabilities.

    What should you integrate into the pipeline?

    Select only one answer.

    - GitHub secret scanning
    - **Mend Bolt**
    - OWASP Zed Attack Proxy (ZAP)
    - SonarQube

    Mend Bolt automatically detects vulnerable OSS components, outdated libraries, and license compliance issues in code. SonarQube is a source code analysis tool that supports specific programming languages. OWASP ZAP is designed to run penetration testing against applications. GitHub secret scanning is used to perform code scanning for secrets.

    [Implement open-source software – Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-open-source-software-azure/)

22. You have a GitHub repository that contains a project named Project1. Source code scanning for Project1 is performed by using a third-party tool.

    You plan to integrate the source code analysis results from the third-party tool into the GitHub repository by using Static Analysis Results Interchange Format (SARIF) files.

    You need to identify two tools that support uploading a SARIF file to the GitHub repository.

    Which two tools should you identify? Each correct answer presents a complete solution.

    Select all answers that apply.

    - Azure DevOps CLI
    - Azure Storage Explorer
    - **CodeQL CLI**
    - **GitHub Actions**

    Correct: CodeQL CLI is a standalone product that can be used to analyze code and generate a CodeQL database that performs queries and produces results in the SARIF format.

    Correct: A GitHub Actions workflow can be configured to use the `upload-sarif` action to upload a SARIF-based file.

    Incorrect: CodeQL workflow does not enable the upload of a SARIF file to a repository.

    Incorrect: Azure Storage Explorer is used to upload files to an Azure Storage account not to GitHub.

    Incorrect: Azure DevOps CLI is used to manage Azure DevOps by using Azure CLI commands.

    [Enable code scanning with third party tools - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-code-scanning/3-enable-code-scanning-with-third-party-tools)

23. You have a Scrum-based project in Azure DevOps.

    You need to monitor and count work items as they move to a different state.

    What should you use to perform the monitoring activity?

    Select only one answer.

    - **cumulative flow diagrams (CFD)**

    - cycle time

    - sprint burndown

    - velocity widget

    Two CFD charts can be used to monitor the flow of work: the in-context report and the CFD widget. The velocity widget is used to track the amount of work that a team can achieve in a sprint. Sprint burndown helps monitor the remaining work in a sprint. Cycle time shows work items closed in a specified timeframe.

    [View and configure the cumulative flow diagram (CFD) reports - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/report/dashboards/cumulative-flow?view=azure-devops)

    [Choose the right project - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/choose-right-project/)

24. You plan to use the metrics and Key Performance Indicators (KPIs) of Azure DevOps projects to validate that your team is meeting its goals and expectations.

    You need to identify the KPI that is used to measure the quality and security associated with a project in Azure DevOps.

    Which KPI should you identify?

    Select only one answer.

    - Application Performance
    - Lead Time
    - **Mean time to recover**
    - Server to Admin Ratio

    Mean time to recover is an example of a quality and security metric. Server to Admin Ratio and Application Performance are examples of efficiency metrics. Lead Time is an example of a faster outcome metric.

    [Identify project metrics and key performance indicators (KPIs) - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/choose-right-project/6-identify-project-metrics-key-performance-indicators-kpis)

    [Understand dashboards, charts, reports & widgets - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/report/dashboards/overview?view=azure-devops)

25. You plan to use the metrics and Key Performance Indicators (KPIs) for Azure DevOps projects to ensure that your team is meeting goals and expectations.

    You need to identify the KPI that represents a culture metric associated with a project in Azure DevOps.

    Which KPI should you identify?

    Select only one answer.

    - Defect escape rate
    - **Retention rates**

    - Service level agreement achievement

    - Staff Member to Customers Ratio

    Out of all the answer choices, only the Retention rates KPI constitutes an example of a culture metric associated with an Azure DevOps project. Defect escape rate and Service level agreement achievement are examples of a quality and security metric. Staff Member to Customers Ratio is an example of an efficiency metric.

    [Identify project metrics and key performance indicators (KPIs) - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/choose-right-project/6-identify-project-metrics-key-performance-indicators-kpis)

26. You plan to create a project wiki in Azure DevOps.

    You need to format the wiki pages to include headers, bulleted lists, and italicized font.

    Which language should you use to format the pages?

    Select only one answer.

    - HTML
    - JSON
    - **Markdown**
    - XML

    Azure DevOps wikis are written in Markdown, not HTML, JSON, or XML.

    [Introduction to Azure DevOps project wikis - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/share-knowledge-within-teams/3-introduction-azure-devops-project-wikis)

27. You plan to create a project wiki in Azure DevOps.

    You need to create a diagram on the wiki page.

    Which syntax element should you use to designate the beginning of the diagram?

    Select only one answer.::: mermaid

    You plan to create a project wiki in Azure DevOps.

    You need to create a diagram on the wiki page.

    Which syntax element should you use to designate the beginning of the diagram?

    Select only one answer.

    - **::: mermaid**
    - \:zzz:
    - ###
    - \```

    The purpose of the Mermaid syntax in Markdown when implementing Azure DevOps wikis is to create diagrams, not to create images or reference work items and pipelines.

    To add a Mermaid diagram to a wiki page, use the following syntax:

    ```
    ::: mermaid
    
    <mermaid diagram syntax>
    
    :::
    ```

    [Markdown syntax for wikis - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/project/wiki/wiki-markdown-guidance?view=azure-devops)

28. You have an Azure App Service web app named app1 and a project in Azure DevOps named Project1.

    You need to add work items to Project1 based on exceptions detected in app1. The solution must minimize administrative effort.

    What should you use to create work items?

    Select only one answer.

    - **Application Insights**
    - Azure App Configuration
    - Azure Automation
    - Log Analytics

    Application Insights provides direct integration with Azure Boards, allowing you to embed its data into work items. Azure Automation, App Configuration, and Log Analytics do not provide direct integration with Azure Boards. There are currently two locations where you can create work items: Proactive detection and individual instances of activity (that is, exceptions, failures, requests, and so on.).

    [Integrate with Azure Boards - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/share-knowledge-within-teams/4-integrate-azure-boards)

    [Add, rename, delete, and manage team dashboards - Azure DevOps | Microsoft Learn](https://learn.microsoft.com/azure/devops/report/dashboards/dashboards?view=azure-devops)

29. You plan to design a DevSecOps security validation process for your company.

    You need to identify which stage in the process will include an automated Open Source Software (OSS) vulnerability scan.

    Which stage should you identify?

    Select only one answer.

    - continuous deployment
    - **continuous integration**
    - IDE/pull requests
    - nightly test runs

    Continuous integration should include an OSS vulnerability scan. The integrated development environment/pull request step should include static code analysis and code reviews. Nightly test runs should include an infrastructure scan. Continuous deployment should include passive penetration tests, an SSL scan, and an infrastructure scan.

    [Explore key validation points - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/introduction-to-secure-devops/5-explore-key-validation-points)

    [Review code coverage - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/test/review-code-coverage-results?view=azure-devops#artifacts)

30. You plan to design a DevSecOps security validation process for your company.

    You need to identify which stage in the process will include a passive penetration test.

    Which stage should you identify?

    Select only one answer.

    - **continuous deployment**
    - continuous integration
    - IDE/pull requests
    - nightly test runs

    Continuous deployment should include passive penetration tests as well as SSL and infrastructure scans. Nightly test runs should include infrastructure scans and active penetration tests. Continuous integration should include an Open Source Software (OSS) vulnerability scan. The integrated development environment/pull request step should include static code analysis and code reviews.

    [Explore key validation points - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/introduction-to-secure-devops/5-explore-key-validation-points)

    [Control releases with deployment gates - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/release/approvals/gates?view=azure-devops)

31. You have an Azure App Service web app named app1.

    You plan to track the availability of app1 by leveraging native Azure capabilities.

    You need to identify which type of Azure resource you should use to implement the tracking mechanism. The solution must minimize implementation efforts.

    Which Azure resource type should you use?

    Select only one answer.

    - Azure App Configuration
    - Azure Automation
    - Azure DevTest Labs
    - **Azure Functions**

    Azure Functions provides the ability to create and run custom availability tests by relying on the `TrackAvailability()` method (included in the Azure SDK for .NET). Azure Automation can potentially be used in this case, but this would require significantly more effort. Azure DevTest Labs and Azure App Configuration do not provide this functionality.

    [Multi-step web tests will be retired on 31 August 2024 | Azure updates | Microsoft Azure](https://azure.microsoft.com/updates/retirement-notice-transition-to-custom-availability-tests-in-application-insights/)

    [Create and run custom availability tests by using Azure Functions - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/app/availability-azure-functions)

    [Set up and run availability tests - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-provision-environments/6-set-up-run-availability-tests?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.az-400-design-implement-release-strategy)

32. You have a project in Azure DevOps named Project1 that contains a release pipeline named pipeline1. All users use Microsoft Teams.

    A user named User1 does not have access to Project1. User1 must be able to use Teams to provide approval for initiating a run of pipeline1.

    You need to identify the Azure DevOps mechanism that will allow User1 to provide the approval.

    Which mechanism should you identify?

    Select only one answer.

    - a post-deployment gate
    - **a pre-deployment gate**
    - manual intervention
    - manual validation

    Approval integration can be implemented to allow users in Teams approve a pipeline run by using a pre-deployment gate without providing direct access to Azure DevOps. A post-deployment gate is executed after a release is executed. Manual intervention is used to prompt for values or parameters or to edit the release. Manual validation is similar to manual intervention, with the capability to notify users and a timeout option.

    [Integrate Azure Pipelines and Microsoft Teams - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/integrations/microsoft-teams?view=azure-devops#approve-deployments-from-your-channel)

    [Create a release pipeline - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/create-release-pipeline-devops/)

    [Control releases with deployment gates - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/release/approvals/gates?view=azure-devops)

33. You have a project in Azure DevOps named Project1 that contains a continuous integration pipeline named Pipeline1.

    You plan to use Windows-based self-hosted agents for UI tests in Pipeline1.

    You need to identify the option you must configure to apply to the agents.

    Which option should you identify?

    Select only one answer.

    - **Enable Autologon.**
    - Run a screen resolution task.
    - Run a unit test.
    - Run tests in parallel.

    When self-hosted agents are used, autologon must be enabled to allow UI tests to run. A screen resolution task allows additional configurations to be performed, but an autologon configuration is needed first to allow the test to run. To reduce the duration of the test activities, running tests in parallel can be useful, but this strategy does not address this scenario. A unit test is the first step to adding testing to the development process.

    [Configure for UI testing - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/test/ui-testing-considerations?view=azure-devops&tabs=mstest#provisioning-agents-in-azure-vms-for-ui-testing)

    [Run quality tests in your build pipeline by using Azure Pipelines - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/run-quality-tests-build-pipeline/)

34. You are creating an Azure Artifacts artifact.

    You need to provide assurances of backward compatibility.

    Which element of semantic versioning should you use?

    Select only one answer.

    - label
    - major
    - minor
    - **patch**

    A patch element is the only answer that provides assurances of backward compatibility. Other answer choices either do not convey versioning, such as label, or do not provide any assurances of backward compatibility.

    [Understand versioning of artifacts - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-versioning-strategy/2-understand-versioning-of-artifacts)

    [Explore semantic versioning - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-versioning-strategy/3-explore-semantic-versioning)

    [Publish & download Universal Packages - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/artifacts/universal-packages?view=azure-devops&tabs=yaml)

35. Your company plans to implement Azure Artifacts.The company intends to use public and internal npm packages.

    You need to recommend a method of creating separate groupings of public and private npm packages without the risk of name collisions.

    What should you recommend?

    Select only one answer.

    - audit

    - Npm publish

    - NPMRC

    - **scopes**

    Scopes allow you to group npm packages. Audits scan npm packages, but they do not group them. NPMRC is a file used to provide npm configuration settings. The `npm publish` command is used to upload packages to the feed and make the feed available for consumption.

    [Use npm scopes - Azure Artifacts | Microsoft Learn](https://learn.microsoft.com/azure/devops/artifacts/npm/scopes?view=azure-devops)

    [Create a new Node.js project using JavaScript and work with package dependencies - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/create-nodejs-project-dependencies/)

36. You plan to create a project in Azure DevOps.

    You need to identify which Azure DevOps feature enables the sharing of arbitrary values across all the definitions in the project.

    Which Azure DevOps feature should you identify?

    Select only one answer.

    - predefined variables
    - release pipeline variables
    - stage variables
    - **variable groups**

    Variable groups provide the ability to share arbitrary values across all the definitions in the same project. The values of predefined variables are assigned automatically, while the stage and pipeline variables have a smaller scope than the entire project.

    [Explore variables in release pipelines - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-modularize-tasks-templates/4-explore-variables-release-pipelines)

    [Publish NuGet packages with Pipeline tasks or the classic editor - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/artifacts/nuget?view=azure-devops&tabs=yaml)

37. You have an Azure DevOps organization.

    You plan to implement task groups in Azure Pipelines.

    You need to identify which types of pipelines you can use.

    Which pipeline types should you identify?

    Select only one answer.

    - **classic build and classic release only**

    - classic release only

    - YAML and classic release only

    - YAML only

    Task groups are available only in classic build and classic release pipelines. For YAML pipelines, you can use templates.

    [Examine task groups - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/manage-modularize-tasks-templates/2-examine-task-groups)

    [Build and publish Artifacts using Gradle - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/artifacts/pull-package-gradle?view=azure-devops)

38. Your company plans to choose between GitHub and Azure DevOps as its DevOps platform based on each technology’s support for CI/CD pipelines.

    You need to identify two unique advantages that distinguish Azure Pipelines from GitHub Actions.

    Which two advantages should you identify? Each correct answer presents a complete solution.

    Select all answers that apply.

    - approvals

    - artifacts
    - **deployment groups**
    - **service connections**
    - triggers

    Deployment groups are a logical set of target machines for deployments. Service connections are abstract credentials to external systems. These are both only in Azure Pipelines. Artifacts upload, store, and download artifacts from jobs. Approvals define approval conditions before moving further in the pipeline. Triggers are sets of events that cause the pipeline to be triggered. Artifacts, approvals, and triggers are available in both Azure Pipelines and GitHub Actions.

    [DevOps with .NET and GitHub Actions - Compare GitHub Actions with Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/dotnet/architecture/devops-for-aspnet-developers/actions-vs-pipelines#feature-comparison)

    [Introduction to GitHub Actions - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/introduction-to-github-actions/)

39. You plan to create a YAML pipeline in Azure Pipelines.

    You need to represent a collection of resources targeted for deployment that are subject to approval checks.

    What should you use?

    Select only one answer.

    - dependencies
    - **environment**
    - gates
    - service connections

    Environment represents a collection of resources targeted for deployment. Gates support the automatic collection and evaluation of external health signals prior to completing a release stage. Dependencies specify a requirement that must be met to run the next job or stage. Service connections enable a connection to a remote service that is required to execute tasks in a job.

    [Describe Azure Pipelines and YAML - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/describe-pipelines-concurrency/6-describe-azure-pipelines-yaml)

    [Use Azure Pipelines - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/get-started/pipelines-get-started?view=azure-devops#feature-availability)

    [Create target environment - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/process/environments?view=azure-devops)

40. You plan to create an Azure Pipelines release pipeline that will be used for blue-green deployments of a .NET Core web app named App1.

    You need to identify which service to use to implement a staging environment and perform a blue-green deployment of App1 to the environment. The solution must minimize configuration and deployment effort.

    Which service should you identify?

    Select only one answer.

    - Azure App Configuration
    - **Azure App Service**
    - Azure Application Gateway
    - Azure Automation

    App Services includes provisions for implementing staging environments and deploying apps (including .NET Core apps). Azure Automation can potentially be configured to implement a staging environment and deploy apps, but this requires considerably more effort. App Configuration does include provisions for storing key/value pairs that represent different types of environments, but it has no ability to deploy apps into App Configuration. Similarly, Application Gateway is a load balancer that can be used to direct traffic to a staging environment, but it has no ability to deploy apps to App Gateway.

    [Exercise - set up a blue–green deployment - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-blue-green-deployment-feature-toggles/4-exercise-set-up-blue-green-deployment)

    [Set up staging environments - Azure App Service | Microsoft Learn](https://learn.microsoft.com/azure/app-service/deploy-staging-slots)

41. You have a web app that runs on Azure virtual machines in multiple Azure regions. The virtual machines are accessed by using the public IPv6 addresses assigned to their network adapters. The IPv6 addresses are **NOT** associated with DNS names.

    You plan to use Azure Traffic Manager to load balance requests across all instances of the web apps.

    You need to identify which Traffic Manager traffic distribution method supports targeting IPv6 addresses as its endpoints.

    Which Traffic Manager traffic distribution method should you identify?

    Select only one answer.

    - **MultiValue**
    - Performance
    - Priority
    - Weighted

    MultiValue is the only Traffic Manager traffic distribution method that provides the ability to specify the IPv4 and IPv6 addresses of its endpoints. All others, including Performance, Priority, and Weighted, require that the endpoints be designated as DNS names only.

    [Examine Traffic Manager - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-canary-releases-dark-launching/3-examine-traffic-manager)

    [Azure Traffic Manager | Microsoft Learn](https://learn.microsoft.com/azure/traffic-manager/traffic-manager-overview)

42. You are planning a release engineering strategy for your company.

    You need to recommend a deployment approach that will expedite identifying potential issues associated with a new release by making the release available to all users at once.

    Which deployment approach should you use?

    Select only one answer.

    - **blue-green**
    - canary release
    - dark launching
    - ring

    A Canary release is a deployment strategy used to test new features on a specific set of users. Blue-green deployments are done in a dedicated environment used to switch users from blue to green. Dark launching, like canary, presents features to a specific set of users, but it assesses user responses to new features in the frontend rather than testing the performance of the backend. Ring gradually exposes releases by using deployment rings.

    [Release Engineering Continuous deployment - Microsoft Azure Well-Architected Framework | Microsoft Learn](https://learn.microsoft.com/azure/architecture/framework/devops/release-engineering-cd#release-process)

    [What is blue-green deployment? - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-blue-green-deployment-feature-toggles/2-what-blue-green-deployment)

43. You review the software development and delivery practices of your company.

    You need to recommend what to use to turn on or off a designated functionality in a deployed code without requiring redeployment.

    What should you recommend?

    Select only one answer.

    - continuous integration
    - continuous testing
    - **feature flags**
    - release gates

    Feature flags allow you to add a feature that can be switched on or off based on a flag. Continuous integration is the process of building and testing automation. Continuous testing is part of the development process. Using release gates is a way of delivering quality to the DevOps circle. It is not recommended for use when implementing feature flags.

    [Tutorial: Use Azure App Configuration to manage feature flags - Azure App Configuration | Microsoft Learn](https://learn.microsoft.com/azure/azure-app-configuration/manage-feature-flags)

    [Understand feature management using Azure App Configuration | Microsoft Learn](https://learn.microsoft.com/azure/azure-app-configuration/concept-feature-management)

    [Introduction to feature toggles - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-blue-green-deployment-feature-toggles/5-introduction-feature-toggles)

44. You plan to control the configuration of Azure virtual machines by using PowerShell Desired State Configuration (DSC).

    You need to identify which service provides built-in PowerShell DSC pull server functionality.

    Which service should you identify?

    Select only one answer.

    - Azure App Configuration
    - Azure Application Gateway
    - **Azure Automation**
    - Azure Policy

    Azure Automation provides a built-in PowerShell DSC pull server. App Configuration facilitates implementing feature flags, but it does not provide a built-in PowerShell DSC pull server. Application Gateway is a load balancer. Azure Policy provides governance and policy enforcement, but it does not function as a PowerShell DSC pull server.

    [Explore Azure Automation State configuration (DSC) - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/implement-desired-state-configuration-dsc/4-explore-azure-automation)

    [Azure Automation overview | Microsoft Learn](https://learn.microsoft.com/azure/automation/overview)

45. You plan to implement the automated validation of Azure Resource Manager (ARM) templates for your company.

    You need to identify two sections that must be present in every ARM template.

    Which two sections should you identify? Each correct answer presents part of the solution.

    Select all answers that apply.

    - apiProfile
    - **contentVersion**
    - functions
    - parameters
    - **schema**

    The `schema` and `contentVersion` sections are mandatory in ARM templates. `functions`, `apiProfile`, and `parameters` are optional in ARM templates.

    [Explore Azure Resource Manager template structure - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/create-azure-resource-manager-template-vs-code/2-explore-template-structure?tabs=azure-cli)

46. You have an Azure subscription that contains 1,000 virtual machines.

    You need to use an Azure service to inventory the status of and track changes to the operating system on the virtual machines. The solution must minimize administrative effort.

    Which Azure service should you use?

    Select only one answer.

    - **Azure Automation**
    - Azure Policy
    - Microsoft Defender for Cloud
    - Microsoft Sentinel

    Azure Automation offers configuration management for an application infrastructure, not only in Azure. Release gates are used to control how deployment pipelines are released. App Configuration is used to store application configurations and implement feature flags, but it does not offer configuration management. Azure Policy is used to enforce standards and assess compliance. It does not provide inventory or change tracking.

    [Azure Automation overview | Microsoft Learn](https://learn.microsoft.com/azure/automation/overview#configuration-management)

    [Explore Azure Automation with DevOps - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/explore-azure-automation-devops/)

47. You have an Azure subscription that contains 1,000 virtual machines.

    You plan a configuration management solution for the virtual machines.

    You need to recommend an agentless solution that supports declarative configuration management.

    What should you include in the recommendation?

    Select only one answer.

    - **Ansible**
    - Azure Automation
    - Chef
    - Puppet

    Ansible provides the ability to identify Azure resources and send configurations without an agent installed. Chef and Puppet require that an agent be installed. Azure Automation requires an agent or extension.

    [Using Ansible with Azure | Microsoft Learn](https://learn.microsoft.com/azure/developer/ansible/overview)

    [Explore infrastructure as code and configuration management - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/explore-infrastructure-code-configuration-management/)

48. You have an Azure DevOps organization that uses self-hosted agents to execute long-running jobs.

    You plan to replace self-hosted agents with Microsoft-hosted agents.

    You need to identify the maximum duration of a job run on a Microsoft-hosted agent.

    What should you identify?

    Select only one answer.

    - 2 hours

    - **6 hours**

    - 12 hours

    - 24 hours

    The maximum duration of a build running on a Microsoft-hosted agent is six hours.

    [Integrate with Azure Pipelines - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/integrate-azure-pipelines/)

    [Microsoft-hosted agents for Azure Pipelines - Azure Pipelines | Microsoft Learn](https://learn.microsoft.com/azure/devops/pipelines/agents/hosted?view=azure-devops&tabs=yaml#capabilities-and-limitations)

49. You have an Azure DevOps organization that uses Microsoft-hosted agents to run build pipelines.

    You plan to switch from Microsoft-hosted agents to self-hosted agents.

    You need to identify which functionality will become available once you complete the switch.

    Which functionality should you identify?

    Select only one answer.

    - **support for incremental builds**

    - support for XAML builds

    - the ability to drop artifacts to Uniform Naming Convention (UNC) file shares

    - the ability to use general purpose Azure virtual machine SKUs

    Only self-hosted agents support incremental builds. Both Microsoft-hosted and self-hosted agents can run on general purpose virtual machine SKUs. The Microsoft-hosted agent uses the general purpose Standard_DS2_v2 virtual machine SKU, while with a self-hosted agent, you can choose any virtual machine size. Microsoft-hosted agents do not support dropping artifacts to UNC file shares. XAML builds have been deprecated, but they were not supported by Microsoft-hosted agents.

    [Integrate with Azure Pipelines - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/integrate-azure-pipelines/)

50. You use Azure Pipelines to deploy applications.

    You need to publish Microsoft Power BI reports that show Azure Pipelines analytics. The solution must minimize development effort.

    What should you create?

    Select only one answer.

    - a GraphQL feed

    - an Azure Data Factory pipeline

    - an Azure Synapse Analytics pipeline

    - **an OData feed**

    An OData feed provides a straightforward approach to publishing reports that show Azure Pipelines analytics. GraphQL, Azure Data Factory, and Azure Synapse Analytics pipelines can potentially be used in this case, but they require more significant development effort.

    [Exercise - Monitor the health of your pipeline - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/create-release-pipeline/6-monitor-pipeline-health)