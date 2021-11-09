def jiraNotification() {
    
    try{
                        
    def searchResults = jiraJqlSearch jql: "project = ${project_name} AND summary ~ SCA-${app_name}"
    def issues = searchResults.data.issues
    def key = issues[0].key
    echo searchResults.data.issues.summary.toString()


    def jiraTask = [fields: [ project: [key: "${project_name}"],
        summary: "SCA-${app_name}",
        description: "SCA-${app_name} automatically written from Jenkins. Job name: ${JOB_NAME} Build Numer: ${BUILD_NUMBER} Build url: ${LOG_BUILD_URL}",
        issuetype: [name: 'Task']]]

    response = jiraEditIssue idOrKey: "${key}", issue: jiraTask
    echo response.successful.toString()
    echo response.data.toString()
    echo "ISSUE EDITED"

    } catch(error){

        def issue = [fields: [ project: [key: "${project_name}"],
            summary: "SCA-${app_name}",
            description: "SCA-${app_name} automatically written from Jenkins. Job name: ${JOB_NAME} Build Numer: ${BUILD_NUMBER} Build url: ${LOG_BUILD_URL}",
            issuetype: [name: 'Task']]]

        def newIssue = jiraNewIssue issue: issue, site: 'Jira'
        
        echo newIssue.data.key
        echo "summary: ${issue.fields.summary}"
        echo "ISSUE CREATED"
    }
}

return this

