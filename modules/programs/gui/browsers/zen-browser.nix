{
  pkgs, 
  inputs, 
  ... 
}:
{
    environment.systemPackages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
      inputs.zen-browser.packages."${system}".specific
      inputs.zen-browser.packages."${system}".generic
    ]; 
    
}
