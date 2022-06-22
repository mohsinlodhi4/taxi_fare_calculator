<%@ page import="java.io.*" %>
<%
class RecordKeeper{
	public String name;
	public String phone;
	public String origin;
	public String destination;
	public String distance;
	public String price;
	
	
	public RecordKeeper(String name, String phone, String origin, String destination, String distance, String price ){
		this.name = name;
		this.phone = phone;
		this.origin = origin;
		this.destination = destination;
		this.distance = distance;
		this.price = price;
	}
	
    public void saveRecord() throws IOException {
	   	String strPath = "D://Java Workspace/TaxiFareCalculator/TaxiData.txt";
	   	File strFile = new File(strPath);
	   	boolean fileCreated = strFile.createNewFile();
        BufferedWriter writer = new BufferedWriter(new FileWriter(strFile));
        String fileData = this.toString();

        writer.write(fileData);

        writer.close();
    }

	
	public String toString(){
		return String.format("Name: %s - Phone: %s - Origin: %s - Destination: %s - Distance: %s - Price: %s \n"
				,name,phone,origin, destination, distance, price);
	}
}


RecordKeeper rk = new RecordKeeper(
		request.getParameter("name"),
		request.getParameter("phone"),
		request.getParameter("origin"),
		request.getParameter("destination"),
		request.getParameter("distance"),
		request.getParameter("price")
		);
try{
	rk.saveRecord();
}catch(Exception e){
}

%>