package com.jnote.dao;
// default package

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jnote.vo.Folder;

/**
 	* A data access object (DAO) providing persistence and search support for Folder entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .Folder
  * @author MyEclipse Persistence Tools 
 */

public class FolderDAO extends HibernateDaoSupport  {
		 private static final Log log = LogFactory.getLog(FolderDAO.class);
		//property constants
	public static final String FOLDERNAME = "foldername";
	public static final String USERID = "userid";
	public static final String FOLDERID = "folderid";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Folder transientInstance) {
        log.debug("saving Folder instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Folder persistentInstance) {
        log.debug("deleting Folder instance");
        try {
//        	System.out.println("folder-dao-delete-in");
            getHibernateTemplate().delete(persistentInstance);
//            System.out.println("folder-dao-delete-success");
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
	/**
	 * delete by folderid
	 * @param id
	 * @return
	 */
	public int deleteById(Integer fid){
		try{
//			System.out.println("folder-dao-in-deletebyid");
			String hql = "delete from Folder where folderid=:id";
			Query query = this.getSession().createQuery(hql);
			query.setParameter("id", fid);
			int resultNum = query.executeUpdate();
//			System.out.println("folder-dao-in-deletebyid"+resultNum);
			return resultNum;
		}catch(RuntimeException re){
			throw re;
		}
	}
	
    /*
     * 方法有问题
     */
    public Folder findById( java.lang.Integer id) {
        log.debug("getting Folder instance with id: " + id);
        try {
//        	System.out.println("cominfolderdao"+id);
            Folder instance = (Folder) getHibernateTemplate()
                    .get("Folder", id);
//            System.out.println(instance);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    public Folder findFolderById(java.lang.Integer id){
    	try{
    		List list = findByProperty(FOLDERID, id);
    		return (Folder) list.get(0);
    	}catch (RuntimeException re) {
    		throw re;
    	}
    }
    
    public List findByExample(Folder instance) {
        log.debug("finding Folder instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding Folder instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Folder as model where model." + propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}
    
    /**
     * 
     * @param userid
     * @return
     */
    public List findByUserid(int userid){
    	try{
    		return findByProperty(USERID, userid);
    	}catch(RuntimeException re){
    		throw re;
    	}
    }
    
    /**
     * 
     * @return
     */
    public List findRootFolder(int userid){
    	try{
    		List  lists = null;
    		String hql ="from Folder where userid=:id and parentid is null";
    		Query query = this.getSession().createQuery(hql);
    		query.setParameter("id", userid);
    		lists = query.list();
    		return lists;
    	}catch(RuntimeException re){
    		throw re;
    	}
    }
    
    public List findChildFolder(int userid,int parentid){
    	try{
//    		System.out.println("dao-folder-findchildfolder-in");
    		List lists = null;
    		String hql ="from Folder where userid=:uid and parentid=:pid";
    		Query query = this.getSession().createQuery(hql);
    		query.setParameter("uid", userid);
    		query.setParameter("pid", parentid);
    		lists = query.list();
    		return lists;
    	}catch(RuntimeException re){
    		throw re;
    	}
    }

	public List findByFoldername(Object foldername){
		return findByProperty(FOLDERNAME, foldername);
	}
	

	public List findAll() {
		log.debug("finding all Folder instances");
		try {
			String queryString = "from Folder";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Folder merge(Folder detachedInstance) {
        log.debug("merging Folder instance");
        try {
            Folder result = (Folder) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Folder instance) {
        log.debug("attaching dirty Folder instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Folder instance) {
        log.debug("attaching clean Folder instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static FolderDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (FolderDAO) ctx.getBean("FolderDAO");
	}
}