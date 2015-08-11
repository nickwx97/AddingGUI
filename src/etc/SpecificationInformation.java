package etc;

public class SpecificationInformation {
	
	private int count = 0;
	private char[] specChar;
	
	
	public SpecificationInformation(String spec) {
		super();
		
		//populate the specChar[]
		specChar = new char[spec.length()];
		for(int i=0;i<spec.length();i++){
			specChar[i]=spec.charAt(i);
		}
		
		
	}
	
	public String getSpec(int startAt){
		String spec="";
		count = startAt;
		for(int i=startAt;i<specChar.length;i++){
			if(specChar[i]!=';'){
				spec+=specChar[i];
			}else{
				//to +1 more to count to not point at the ; for next use
				count++;
				break;
			}
			count++;
		}
		return spec;
	}


	public int getCount() {
		return count;
	}
	
	
}
