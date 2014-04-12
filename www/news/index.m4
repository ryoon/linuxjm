m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_define(`_SUB_ONE',1)m4_dnl
m4_include(../jm_www.m4)
m4_include(../news_macro.m4)
_EDIT_WARNING(index)
_HEADER(JM 新着情報)

 <DIV CLASS="copyright">
  m4_esyscmd(`date')
 </DIV>

m4_dnl This is an anchor for ml2cvs. DON'T REMOVE.
m4_dnl ML2CVS ADD HERE
 <H2>2014/04/13</H2>
 <P>
 ebtables 2.0.10-4 の翻訳を公開しました。
 <UL>
 <LI>_NEW_PAGE(ebtables, ebtables.8)
 </UL>
 </P>

 <H2>2013/10/14</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.54 対応版)を公開しました。
 </P>
 <H2>2013/08/16</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.53 対応版)を公開しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, kcmp.2)
   _NEW_PAGE(LDP_man-pages, CPU_SET.3)
   _UPD_PAGE(LDP_man-pages, fchownat.2)
   _UPD_PAGE(LDP_man-pages, fstatat.2)
   _UPD_PAGE(LDP_man-pages, linkat.2)
   _UPD_PAGE(LDP_man-pages, readlinkat.2)
   _UPD_PAGE(LDP_man-pages, proc.5)
   _UPD_PAGE(LDP_man-pages, inotify.7)
   _UPD_PAGE(LDP_man-pages, man-pages.7)
  </DD>
 </DL>

 <H2>2013/05/01</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.51 対応版)を公開しました。
 </P>

 <H2>2013/04/30</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU_sed (sed 4.2.2 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_sed, sed.1)
  </DD>
 </DL>

 <H2>2013/03/25</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.50 対応版)を公開しました。
 </P>
 
 <H2>2012/07/07</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>cups (cups 1.5.3 への更新)</DT>
  <DD>
   _NEW_PAGE(cups, cancel.1)
   _NEW_PAGE(cups, lp.1)
   _NEW_PAGE(cups, lpoptions.1)
   _NEW_PAGE(cups, lpq.1)
   _NEW_PAGE(cups, lpr.1)
   _NEW_PAGE(cups, lprm.1)
   _NEW_PAGE(cups, lpstat.1)
   _NEW_PAGE(cups, lpadmin.8)
   _NEW_PAGE(cups, lpc.8)
  </DD>
 </DL>

 <H2>2012/06/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, sched_setscheduler.2)
   _NEW_PAGE(LDP_man-pages, setns.2)
   _UPD_PAGE(LDP_man-pages, pthread_cancel.3)
   _NEW_PAGE(LDP_man-pages, pthread_cleanup_push.3)
   _NEW_PAGE(LDP_man-pages, pthread_cleanup_push_defer_np.3)
   _UPD_PAGE(LDP_man-pages, pthread_kill_other_threads_np.3)
   _UPD_PAGE(LDP_man-pages, pthread_setcancelstate.3)
   _UPD_PAGE(LDP_man-pages, proc.5)
  </DD>
 </DL>

 <H2>2012/06/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>acl (acl 2.2.51 への更新)</DT>
  <DD>
   _UPD_PAGE(acl, getfacl.1)
   _UPD_PAGE(acl, setfacl.1)
   _UPD_PAGE(acl, acl.5)
  </DD>
  <DT>GNU_gzip (gzip 1.4 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_gzip, gzexe.1)
   _UPD_PAGE(GNU_gzip, gzip.1)
   _UPD_PAGE(GNU_gzip, zdiff.1)
   _UPD_PAGE(GNU_gzip, zgrep.1)
   _NEW_PAGE(GNU_gzip, zless.1)
   _UPD_PAGE(GNU_gzip, zmore.1)
  </DD>
  <DT>GNU_cpio (cpio 2.11 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_cpio, cpio.1)
   _UPD_PAGE(GNU_cpio, mt.1)
  </DD>
  <DT>GNU_make (make 3.82 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_make, make.1)
  </DD>
 </DL>

 <H2>2012/06/02</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU_gdbm (make 1.8.3 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_gdbm, gdbm.3)
  </DD>
  <DT>GNU_ed (ed 0.5 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_ed, ed.1)
  </DD>
 </DL>

 <H2>2012/05/31</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.41 対応版)を公開しました。
 </P>
 
 <H2>2012/05/09</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>sudo</DT>
  <DD>
   _UPD_PAGE(sudo, sudo.8)
   _UPD_PAGE(sudo, sudoers.5)
   _UPD_PAGE(sudo, sudoers.ldap.5)
   _NEW_PAGE(sudo, sudoreplay.8)
   _UPD_PAGE(sudo, visudo.8)
  </DD>
 </DL>

 <H2>2012/05/03</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.40 対応版)を公開しました。
 </P>
 
 <H2>2012/04/21</H2>
 <P>
  _LINK(../INDEX/gnu.html#GNU_coreutils,GNU coreutils 8.16 の翻訳)を公開しました。
  (新規公開のため、ファイルリストは掲載していません)
 </P>

 <H2>2012/04/01</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU_bash</DT>
  <DD>
   _UPD_PAGE(GNU_bash, bash.1)
  </DD>
 </DL>

 <H2><A NAME="OLDNEWS">過去の新着情報</A></H2>
 <UL>
  <LI>_LINK(news2011.html,2011年)
  <LI>_LINK(news2010.html,2010年)
  <LI>_LINK(news2009.html,2009年)
  <LI>_LINK(news2008.html,2008年)
  <LI>_LINK(news2007.html,2007年)
  <LI>_LINK(news2006.html,2006年)
  <LI>_LINK(news2005.html,2005年)
  <LI>_LINK(news2004.html,2004年)
  <LI>_LINK(news2003.html,2003年)
  <LI>_LINK(news2002.html,2002年)
  <LI>_LINK(news2001.html,2001年)
  <LI>_LINK(news2000.html,2000年)
  <LI>_LINK(news1999.html,1999年)
 </UL>

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>
