
                            <form action="" method="post" >
                             <div class="form-group">
                             <label for="cat_title">Edit Category</label>
                             <?php
                    if(isset($_GET['edit']))
                     {
                         $update_cat_id=$_GET['edit'];
                         $query="SELECT * FROM categories where cat_id= $update_cat_id";
                    
                         $select_all_categories1=mysqli_query($connection,$query);
                         while($row=mysqli_fetch_assoc($select_all_categories1))
                         {
                            $cat_id=$row['cat_id'];
                            $cat_title=$row['cat_title'];
                            ?>
                            <input type="text" class="form-control" value="<?php if(isset( $cat_title)){ echo $cat_title ; } ?>" name="cat_title"> 
                        
                       
                        <?php }
                      
                         } ?>
                            
                        <?php
                      if(isset($_POST['update']))    
                      {
                          $the_cat_title=$_POST['cat_title'];
                          $query="UPDATE categories SET cat_title = '{$the_cat_title}'  where cat_id = {$cat_id} ";
                          $update_query=mysqli_query($connection,$query);
                          if(!$update_query)
                          {
                              die("Query Failed".mysqli_error($connection));
                          }
                      }
                                 
                                 
                             
                        ?>     
                             
                                
                                 
                             </div>   
                             <div class="form-group">
                             <input type="submit" class="btn btn-success" name="update" value="Update Category">    
                                 
                             </div>     
                                
                            </form> 