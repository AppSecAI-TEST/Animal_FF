package freeboard;

import java.util.List;

import paging.PagingBean;


public interface ifreeboardDao {
	public boolean writefb(freeboardDto dto);
	public freeboardDto getBbs(int seq);
	public void readCount(int seq);	
	public List<freeboardDto> getBbsPagingList(PagingBean paging);
}
