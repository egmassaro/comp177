
class TreeNode {
  TreeNode parent;
  ArrayList<TreeNode> children;
  String ID;
  int area; //double check if we need to swap up to something bigger

  ArrayList<TreeNode> path(String ID){
    ArrayList<TreeNode> list = null;
    if(ID.equals(this.ID)){
      list = new ArrayList<TreeNode>();
      list.add(this);
    }else if(!isLeaf()){
      for(TreeNode child : children){
        list = child.path(ID);
        if(null != list){
          list.add(this);
          return list;
        }
      }
    }
    return list;
  }
  
  TreeNode(String ID, int area){
    this.ID = ID;
    this.area = area;
    children = new ArrayList<TreeNode>();
  }
  
  void addChild(TreeNode child){
    children.add(child);  
  }
  
  int getDepth(){
     if(isRoot()){
       return 0;  
     }else{
       return 1 + parent.getDepth();   
     }
  }
  
  int getMaxDepth(){
    if(isLeaf()){
      return 0;  
    }else{
      int maxDepth = Integer.MIN_VALUE;
      for(TreeNode node : children){
        if(node.getMaxDepth() > maxDepth){
          maxDepth = node.getMaxDepth();  
        }
      } 
      return 1 + maxDepth;
    }
  }
  
  void sortChildren(){
    ArrayList<TreeNode> sortedChildren = new ArrayList<TreeNode>(children.size()); 
    for(TreeNode child : children){
      int i = 0;
      while(i < sortedChildren.size()){
        if(child.getArea() > sortedChildren.get(i).getArea()){
          break;  
        }
        i++; 
      }
      sortedChildren.add(i, child);
      child.sortChildren();
    }
    children = sortedChildren;
  }
  
  void setParent(TreeNode parent){
   this.parent = parent; 
  }
  
  
  ArrayList<TreeNode> getLeaves(){
    ArrayList<TreeNode> myList = new ArrayList<TreeNode>();
    if(!isLeaf()){
      for(TreeNode child : children){
        if(child.isLeaf()){
          myList.add(child);  
        }else{
          myList.addAll(child.getLeaves());
        }
      }
    }
    return myList;
  }
  
  int numLeaves(){
    if(isLeaf()){
     return 1; 
    }else{
     int sum = 0;
     for(int i = 0; i < children.size(); i++){
        sum += children.get(i).numLeaves(); 
     }
     return sum;
    }
  }
  
  boolean isRoot(){
   return null == parent; 
  }
  
  boolean isLeaf(){
    return null == children || children.isEmpty();  
  }
  
  int getArea(){
    if(isLeaf()){
     return area; 
    }else{
       int sum = 0;
       for(int i = 0; i < children.size(); i++){
          sum += children.get(i).getArea(); 
       }
       return sum;
    }
  }
}