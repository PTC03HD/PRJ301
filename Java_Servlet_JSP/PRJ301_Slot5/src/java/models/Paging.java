/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author phamt
 */
public class Paging {
    private int nrpp;
    private int start;
    private int size;

    public Paging(int nrpp, int start, int size) {
        this.nrpp = nrpp;
        this.start = start;
        this.size = size;
    }
    
    //thuộc tính inpur nên đưa vào contructor, không nên để thuộc tính output vào đây

    public Paging() {
    }
    
    private int totalPage; //tổng số trang
    private int begin; 
    private int end;

    public int getNrpp() {
        return nrpp;
    }

    public void setNrpp(int nrpp) {
        this.nrpp = nrpp;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }
    
    private int pageStart;
    private int pageEnd;

    public int getPageStart() {
        return pageStart;
    }

    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }
    
    public void calc(){
//        totalPage = size/nrpp+(size%nrpp==0?0:1);
        totalPage = (size+nrpp-1)/nrpp;
        start = start<0?0:start;
        start = start>=totalPage?(totalPage - 1):start;
        begin = start*nrpp; //bán đoạn (begin, end)
        end = begin+nrpp;
        end = end>size?size:end;
        pageStart = start-2;
        pageStart = pageStart<0?0:pageStart;
        pageEnd = start+2;
        pageEnd = pageEnd>totalPage-1?totalPage-1:pageEnd;
    }
}
