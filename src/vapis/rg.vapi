/* rg.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Rg", gir_namespace = "Rg", gir_version = "1.0", lower_case_cprefix = "rg_")]
namespace Rg {
	[CCode (cheader_filename = "realtime-graphs.h", type_id = "rg_column_get_type ()")]
	public class Column : GLib.Object {
		[CCode (has_construct_function = false)]
		public Column (string name, GLib.Type value_type);
		public unowned string get_name ();
		public void set_name (string name);
		public string name { get; set; }
		[NoAccessorMethod]
		public GLib.Type value_type { get; construct; }
	}
	[CCode (cheader_filename = "realtime-graphs.h", type_id = "rg_cpu_graph_get_type ()")]
	public class CpuGraph : Rg.Graph, Atk.Implementor, Gtk.Buildable {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public CpuGraph ();
		[NoAccessorMethod]
		public uint max_samples { get; construct; }
		[NoAccessorMethod]
		public int64 timespan { get; construct; }
	}
	[CCode (cheader_filename = "realtime-graphs.h", type_id = "rg_cpu_table_get_type ()")]
	public class CpuTable : Rg.Table {
		[CCode (has_construct_function = false, type = "RgTable*")]
		public CpuTable ();
	}
	[CCode (cheader_filename = "realtime-graphs.h", type_id = "rg_graph_get_type ()")]
	public class Graph : Gtk.DrawingArea, Atk.Implementor, Gtk.Buildable {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public Graph ();
		public void add_renderer (Rg.Renderer renderer);
		public unowned Rg.Table? get_table ();
		public void set_table (Rg.Table table);
		public Rg.Table table { get; set; }
	}
	[CCode (cheader_filename = "realtime-graphs.h", type_id = "rg_line_renderer_get_type ()")]
	public class LineRenderer : GLib.Object, Rg.Renderer {
		[CCode (has_construct_function = false)]
		public LineRenderer ();
		public unowned Gdk.RGBA? get_stroke_color_rgba ();
		public void set_stroke_color (string stroke_color);
		public void set_stroke_color_rgba (Gdk.RGBA stroke_color_rgba);
		[NoAccessorMethod]
		public uint column { get; set; }
		[NoAccessorMethod]
		public double line_width { get; set; }
		[NoAccessorMethod]
		public string stroke_color { owned get; set; }
		public Gdk.RGBA stroke_color_rgba { get; set; }
	}
	[CCode (cheader_filename = "realtime-graphs.h", ref_function = "rg_ring_ref", type_id = "rg_ring_get_type ()", unref_function = "rg_ring_unref")]
	[Compact]
	public class Ring {
		public uint8 data;
		public uint len;
		public uint pos;
		public uint append_vals (void* data, uint len);
		public void @foreach (GLib.Func func);
		public Rg.Ring @ref ();
		[CCode (cname = "rg_ring_sized_new", has_construct_function = false)]
		public Ring.sized_new (uint element_size, uint reserved_size, GLib.DestroyNotify element_destroy);
		public void unref ();
	}
	[CCode (cheader_filename = "realtime-graphs.h", type_id = "rg_table_get_type ()")]
	public class Table : GLib.Object {
		[CCode (has_construct_function = false)]
		public Table ();
		public uint add_column (Rg.Column column);
		public int64 get_end_time ();
		public bool get_iter_first (Rg.TableIter iter);
		public bool get_iter_last (Rg.TableIter iter);
		public uint get_max_samples ();
		public GLib.TimeSpan get_timespan ();
		public void push (out Rg.TableIter iter, int64 timestamp);
		public void set_max_samples (uint n_rows);
		public void set_timespan (GLib.TimeSpan timespan);
		public uint max_samples { get; set construct; }
		public int64 timespan { get; set construct; }
		[NoAccessorMethod]
		public double value_max { get; set; }
		[NoAccessorMethod]
		public double value_min { get; set; }
		public signal void changed ();
	}
	[CCode (cheader_filename = "realtime-graphs.h", type_cname = "RgRendererInterface", type_id = "rg_renderer_get_type ()")]
	public interface Renderer : GLib.Object {
		public abstract void render (Rg.Table table, int64 x_begin, int64 x_end, double y_begin, double y_end, Cairo.Context cr, Cairo.RectangleInt area);
	}
	[CCode (cheader_filename = "realtime-graphs.h", has_type_id = false)]
	public struct TableIter {
		[CCode (array_length = false, array_null_terminated = true)]
		public weak void*[] data;
		public int64 get_timestamp ();
		public void get_value (uint column, GLib.Value value);
		public void get (int first_column, ...);
		public void set (int first_column, ...);
		public bool next ();
	}
	[CCode (cheader_filename = "realtime-graphs.h", cname = "_RgColumnClass", has_type_id = false)]
	public struct _ColumnClass {
		public weak GLib.ObjectClass parent;
	}
}
