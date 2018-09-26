#!groovy

import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.model.Jenkins

def j = Jenkins.instance;
j.setCrumbIssuer(new DefaultCrumbIssuer(true)); 
j.save();
//System.setProperty("hudson.security.csrf.CrumbFilter", "false");
//System.setProperty("hudson.security.csrf", "false");
//System.setProperty("hudson.security.csrf.GlobalCrumbIssuerConfiguration", "false");
