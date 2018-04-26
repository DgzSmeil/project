package com.gs.common.bean;

public class Page {
	 /** 
     * 页大小 
     */  
    private int pageSize;  
  
    /** 
     * 页数 
     */  
    private int pageCount;  
  
    /** 
     * 总记录数 
     */  
    private int recordCount;  
  
    /** 
     * 当前页 
     */  
    private int curPage;  
  
    /** 
     * 第一页 
     */  
    private int firstPage;  
  
    /** 
     * 前一页 
     */  
    private int beforePage;  
  
    /** 
     * 下一页 
     */  
    private int nextPage;  
  
    /** 
     * 最后一页 
     */  
    private int lastPage;  
  
    public int getPageSize()  
    {  
        return pageSize;  
    }  
  
    public void setPageSize(int pageSize)  
    {  
        this.pageSize = pageSize;  
    }  
  
    public int getPageCount()  
    {  
        return pageCount;  
    }  
  
    public void setPageCount(int pageCount)  
    {  
        this.pageCount = pageCount;  
    }  
  
    public int getRecordCount()  
    {  
        return recordCount;  
    }  
  
    public void setRecordCount(int recordCount)  
    {  
        this.recordCount = recordCount;  
    }  
  
    public int getFirstPage()  
    {  
        return firstPage;  
    }  
  
    public void setFirstPage(int firstPage)  
    {  
        this.firstPage = firstPage;  
    }  
  
    public int getBeforePage()  
    {  
        return beforePage;  
    }  
  
    public void setBeforePage(int beforePage)  
    {  
        this.beforePage = beforePage;  
    }  
  
    public int getNextPage()  
    {  
        return nextPage;  
    }  
  
    public void setNextPage(int nextPage)  
    {  
        this.nextPage = nextPage;  
    }  
  
    public int getLastPage()  
    {  
        return lastPage;  
    }  
  
    public void setLastPage(int lastPage)  
    {  
        this.lastPage = lastPage;  
    }  
  
    public int getCurPage()  
    {  
        return curPage;  
    }  
  
    public void setCurPage(int curPage)  
    {  
        this.curPage = curPage;  
        System.out.println("setCurpage is invoke curpape is <"+this.curPage+">");  
    }  
  
    
    public Page()  
    {  
        super();  
        this.pageSize = 5;  
        this.curPage = 1;  
        System.out.println("new Page() is invoke");  
    }  
  
    /** 
     * 重新设置page信息 
     */  
    public void freshPage()  
    {  
        setTotalPageNum();  
          
        initNav();  
  
    }  
      
    /** 
     * 初始化分页导航 
     */  
    public void initNav()  
    {  
         
            this.beforePage = curPage-1;  
            this.nextPage = curPage+1;  
            this.lastPage = pageCount;  
         
          
        if(beforePage<=0)  
        {  
            this.beforePage = 1;  
        }  
          
        if(nextPage>pageCount)  
        {  
            this.nextPage = pageCount;  
        }  
          
          
    }  
  
    /** 
     * 设置总页数 
     */  
    private void setTotalPageNum()  
    {  
        // 得到总的页数  
        if (this.recordCount % this.pageSize == 0)  
        {  
            this.pageCount = this.recordCount / this.pageSize;  
        }  
        else  
        {  
            this.pageCount = this.recordCount / this.pageSize + 1;  
        }  
    }  
}
