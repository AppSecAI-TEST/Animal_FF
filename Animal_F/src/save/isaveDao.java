package save;

import java.util.List;

import paging.PagingBean;

public interface isaveDao {
	public boolean writeBbs(saveDto bbs);	
	public saveDto getBbs(int seq);
	public void readCount(int seq);	
	
	public List<saveDto> getBbsList();
	public List<saveDto> getBbsPagingList(PagingBean paging);
}
