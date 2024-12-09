# tfenv configuration
# {{ ansible_managed }}
export PATH="$PATH:$HOME/.tfenv/bin"

# Global Terraform provider directory to save space
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugins"
alias tfproviders="terraform providers mirror $TF_PLUGIN_CACHE_DIR"
