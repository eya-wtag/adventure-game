component{

this.name = "CF_challenge";
// this.sessionManagement = true;  // Enable session management
// this.sessionTimeout = createTimeSpan(0,2,0,0);  // Set session timeout (e.g., 30 minutes)

this.datasources["cf_challenge"] = {
	class: "com.mysql.cj.jdbc.Driver", 
	bundleName: "com.mysql.cj", 
	bundleVersion: "9.3.0",
	connectionString: "jdbc:mysql://host.docker.internal:3306/cf_challenge?characterEncoding=UTF-8&serverTimezone=Etc/UTC&maxReconnects=3",
	username: "yasi",
	password: "encrypted:884867f7eb91cb44db89df64ba40c0b88950b6e3bf4a5063e1b9592e13d2353d",
	
	// optional settings
	connectionLimit:-1, // default:-1
	liveTimeout:15, // default: -1; unit: minutes
	alwaysSetTimeout:true, // default: false
	validate:false // default: false
	
};



function onApplicationStart(){
   
	restInitApplication(
	dirPath = expandPath("/var/www/api"),
	serviceMapping = "/api",
	password="admin123"
	);
         
}
// function onRequestStart( string targetPage ) {}
// function onRequest( string targetPage  ) {
//          include "/index.cfm";
// }

}
