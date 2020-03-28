using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using XLua;

public class LuaMain : MonoBehaviour
{
    // Start is called before the first frame update
    static LuaEnv luaenv_;
    void Awake()
    {
       
    }

    static public LuaEnv luaenv
    {
        get { if (luaenv_ == null) {
                luaenv_ = new LuaEnv();
                luaenv_.AddLoader(CustomLoader);
                luaenv_.DoString("require 'LuaMain'");
            }
            return luaenv_;
        }
    }

    static private byte[] CustomLoader(ref string fileName)
    {
        
        string luaPath = Application.dataPath + "/LuaScripts/" + fileName + ".lua";
        string strLuaContent = File.ReadAllText(luaPath);
        byte[] result = System.Text.Encoding.UTF8.GetBytes(strLuaContent);
        return result;
    }
    // Update is called once per frame
    void Update()
    {
        if (luaenv != null)
        {
            luaenv.Tick();
        }
    }

    void OnDestroy()
    {

    }
}
