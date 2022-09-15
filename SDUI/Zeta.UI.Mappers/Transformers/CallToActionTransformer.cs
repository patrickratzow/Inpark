using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Mappers.Transformers;

public class CallToActionTransformer : ITransformer<CallToActionNode>
{
    public ValueTask<SDUINode> Transform(CallToActionNode node)
    {
        var url = node.Url;
        var linkText = node.Text;

        var buttonAction = new OpenUrlAction(url);
        var button = new Button();
        button.SetAction("action", buttonAction);
        
        var text = new Text(linkText);
        text.SetParent(button);

        return new(button);
    }
}