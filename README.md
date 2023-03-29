# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

# Notes 

1. Created an CAP Application using the Template Wizard. With CI/CD pipeline
2. Run `cds build --for hana` to generate artifacts for the HANA Database 
3. Run `cds deploy --to hana` to deploy the hana database artifacts to the HANA Cloud. 
4. MTA file was already created. If not use `cds add mta` to add the MTA file. 
5. Initially there are two modules: 1. Service and 2. DB Deployer 
   One resource: 1 Database 
6. After deploying to the HANA database, run the command 
   `cf service` 
   It generated one service with the `{appname}-db`
7. Run the command `cf apps`
   it created two modules.  one for db deployer and and another for service module. 
   name of db-deployer: `{appname}-db-deployer`
   name of service: `{appname}-srv`
8. Add the app router using the command `cds add approuter` 
9. In the app router, set the path for application1 and application2. 
    ```
    {
      "source": "^/app/app1/(.*)$",
      "target": "$1",
      "localDir": "./app1/webapp",
      "authenticationType": "none",
      "cacheControl": "no-cache, no-store, must-revalidate"
    },
    {
      "source": "^/app/app2/(.*)$",
      "target": "$1",
      "localDir": "./app2/webapp",
      "authenticationType": "none",
      "cacheControl": "no-cache, no-store, must-revalidate"
    },
    ```
    The local directory is from where the app path begins from.
9. Adding the app router, added a new module in the mta.yaml file. 
    App router is named with the same name as application. {appname}
10. Adding app router also added a new resource for authorization. 
    The authroization resource is named {appname}-xsuaa. 
11. Since the CAP service is not authenticated, the service does not return data. 
12. Only the app router functionality is working. 