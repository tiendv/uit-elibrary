/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.dto;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class Subjectdetail implements java.io.Serializable {
    private Subject subject;
    private Faculty faculty;

    
    public Subjectdetail() {
    }
    public Subjectdetail(Subject subject, Faculty faculty) {
        this.subject = subject;
        this.faculty = faculty;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    
}
