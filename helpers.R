library(ggplot2)
library(ggpubr)

plot_cons_set_id <- function(data_sim,ideology_num,ideology_name,params,p_names_filt){
    data_sim$pr_scores <- exp(as.matrix(data_sim[,4:10])%*%params[1:7])
    aggr_sum <- aggregate(data_sim$pr_scores, by=list(id=data_sim[,1]), FUN = sum)
    data_plot <- merge(data_sim, aggr_sum, by = "id")
    data_plot$party <- rep(p_names_filt,nrow(data_plot)/length(p_names_filt))
    colnames(data_plot)[3] <- "ideology"
    data_plot$Probability <- data_plot$pr_scores/data_plot$V1
   colnames(data_plot)[2] <- "Party"
   data_plot$Party <- as.factor(data_plot$Party)
   #plot <- ggplot(data=data_plot, aes_string(x="ideology", y="Probability",color="party",group="party"))+
   plot <- ggplot(data=data_plot, aes_string(x="ideology", y="Probability",color="color",group="Party"))+
      geom_line()+
      geom_point()+
     theme(legend.position="right")+
      xlab(ideology_name)+
     ylab("Probability to choose the party")+
     scale_colour_identity("Party", breaks=unique(data_plot$color), labels=unique(data_plot$Party), guide="legend")+
     theme_bw()
   
  return(plot)
}


plot_cons_set_by_party <- function(data_sim,ideology_num,ideology_name,party_code,cons_sets,params){
  data_plot_all <- data.frame()
  p_names <- c("Just Russia","LDPR","CPRF","Yabloko","United Russia","Right Cause")
  p_name <- p_names[party_code]
  
  for (cons_set in cons_sets){
    cons_set <- unlist(cons_set)
    df_cons <- data_sim[data_sim$party %in% cons_set,]
    p_names_cons <- p_names[cons_set]

    df_cons$pr_scores <- exp(as.matrix(df_cons[,4:10])%*%params[1:7])
    aggr_sum <- aggregate(df_cons$pr_scores, by=list(id=df_cons[,1]), FUN = sum)
    data_plot <- merge(df_cons, aggr_sum, by = "id")
    
    colnames(data_plot)[2] <- "party_cons_set"
    data_plot <- data_plot[data_plot$party_cons_set == party_code,]
    c_n <- paste(p_names_cons,collapse=",")
    data_plot$party_cons_set <- rep(c_n,nrow(data_plot))
    
    colnames(data_plot)[3] <- "ideology"
    data_plot$Pr <- data_plot$pr_scores/data_plot$V1
    
    data_plot_all <- rbind(data_plot_all,data_plot)
  }
  
  data_plot_all$party_cons_set <- as.factor(data_plot_all$party_cons_set)
  
  plot <- ggplot(data=data_plot_all, aes_string(x="ideology", y="Pr",color="party_cons_set",group="party_cons_set"))+
    geom_line()+
    geom_point()+
    #theme(legend.position="none")+
    xlab(ideology_name)+
    labs(color='Consideration Sets')+
    ylab("Probability to choose the party")+
    theme_bw()
  return(plot)
}



plot_cons_set_by_party2 <- function(data_sim_1, data_sim_2,ideology_num1,ideology_num2,ideology_name1,ideology_name2,party_code,cons_sets,params){
  data_plot_all1=get_data_plot_all(data_sim_1, ideology_num1, ideology_name1, party_code, cons_sets, params)
  data_plot_all2=get_data_plot_all(data_sim_2, ideology_num2, ideology_name2, party_code, cons_sets, params)
  
  plot1 <- ggplot(data=data_plot_all1, aes_string(x="ideology", y="Pr",color="party_cons_set",group="party_cons_set"))+
    geom_line()+
    geom_point()+
    xlab(ideology_name1)+
    ylab("Probability to choose the party")+
    labs(color='Consideration Sets')+
    theme_bw()
  plot2 <- ggplot(data=data_plot_all2, aes_string(x="ideology", y="Pr",color="party_cons_set",group="party_cons_set"))+
    geom_line()+
    geom_point()+
    xlab(ideology_name2)+
    ylab("Probability to choose the party")+
    labs(color='Consideration Sets')+
    theme_bw()
  plot=ggarrange(plot1, plot2, ncol=2, nrow=1, common.legend = TRUE, legend="right")
  return(plot)
}

get_data_plot_all <- function(data_sim, ideology_num, ideology_name, party_code, cons_sets, params){
    data_plot_all <- data.frame()
    p_names <- c("Just Russia","LDPR","CPRF","Yabloko","United Russia","Right Cause")
    p_name <- p_names[party_code]

    for (cons_set in cons_sets){
      cons_set <- unlist(cons_set)
      df_cons <- data_sim[data_sim$party %in% cons_set,]
      p_names_cons <- p_names[cons_set]
    
      df_cons$pr_scores <- exp(as.matrix(df_cons[,4:10])%*%params[1:7])
      aggr_sum <- aggregate(df_cons$pr_scores, by=list(id=df_cons[,1]), FUN = sum)
      data_plot <- merge(df_cons, aggr_sum, by = "id")
    
      colnames(data_plot)[2] <- "party_cons_set"
      data_plot <- data_plot[data_plot$party_cons_set == party_code,]
      c_n <- paste(p_names_cons,collapse=",")
      data_plot$party_cons_set <- rep(c_n,nrow(data_plot))
    
      colnames(data_plot)[3] <- "ideology"
      data_plot$Pr <- data_plot$pr_scores/data_plot$V1
    
      data_plot_all <- rbind(data_plot_all,data_plot)
    }
      data_plot_all$party_cons_set <- as.factor(data_plot_all$party_cons_set)
    
      return(data_plot_all)
  }


